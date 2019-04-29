class GiftsController < ApiController
  include QuestionnairesHelper

  def index
    token = params[:token]
    if token.nil?
      raise ActionController::ParameterMissing.new("token") # Bad_request
    end
    gift = Gift.find_by(token: token)
    if gift.nil?
      raise ActionController::BadRequest.new("There is no gift with that token!") # 400
    end

    gift.send?

    render json: {
        videoUrl: gift.video_url,
        donorName: gift.donation.get_donor.name,
        amount: gift.donation.amount,
        charityProject: gift.donation.charity_project,
        questionnaire: format_questionnaire(gift.donation.charity_project.questionnaire)
    }, status: :ok
  end
end
