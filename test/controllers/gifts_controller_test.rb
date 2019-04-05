require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ActiveRecord::Base.skip_emails = true
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
  end
end
