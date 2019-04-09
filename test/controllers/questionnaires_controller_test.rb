require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test 'should get :ok with a correct token' do
    questionnaire = questionnaires(:one)
    get questionnaire_path(questionnaire.id)

    assert_response :ok
  end

  test 'should get correct information with a correct id' do
    questionnaire = questionnaires(:one)
    get questionnaire_path(id: questionnaire.id)

    json = JSON.parse(response.body)
    assert_equal 'Quiz1', json['title']
    assert_equal 'AmIAQuestion?', json['questions'][0]['prompt']
    assert_includes json['questions'][0]['answers'], 'ImAnAnswer'
    assert_includes json['questions'][0]['answers'], 'ImAnotherAnswer'

    assert_not_nil json['questions'][0]['correct']['index']
  end
end
