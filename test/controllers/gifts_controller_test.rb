require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Gift.skip_emails = true
  end

  test 'should get error on index with no token' do
    get gifts_path

    assert_response :bad_request
  end

  test 'should get error on index with an incorrect token' do
    get gifts_path(token: 'iiiiiiiii')

    assert_response :bad_request
  end

  test 'should get :ok with a correct token' do
    actual_gift = gifts(:one)
    p actual_gift.donation.charity_project.questionnaire.questions
    get gifts_path(token: actual_gift.token)

    assert_response :ok
  end

  test 'should get correct information with a correct token' do
    actual_gift = gifts(:one)
    get gifts_path(token: actual_gift.token)

    json = JSON.parse(response.body)
    assert_equal 'http://youtube.com/12345j', json['videoUrl']
    assert_equal 'Josep', json['donorName']
    assert_equal 100, json['amount']
    assert_equal 1, json['charityProject']['id']

    # Quiz stuff
    assert_equal 'Quiz1', json['questionnaire']['title']
    assert_equal 'AmIAQuestion?', json['questionnaire']['questions'][0]['prompt']
    assert_includes json['questionnaire']['questions'][0]['answers'], 'ImAnAnswer'
    assert_includes json['questionnaire']['questions'][0]['answers'], 'ImAnotherAnswer'

    assert_not_nil 1, json['questionnaire']['questions'][0]['correct']['index']
  end
end
