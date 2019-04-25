class QuestionnairesController < ApiController
  include QuestionnairesHelper

  def show
    formatted_questionnaire = format_questionnaire Questionnaire.find(params[:id])
    render json: formatted_questionnaire, status: :ok
  end
end
