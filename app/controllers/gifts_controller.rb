class GiftsController < ApplicationController
  def get_gift
    token = params[:token]
    if token.nil?
      raise ActionController::ParameterMissing.new("token")
    end
    gift = Gift.where(token: token).first
    if gift.nil?
      raise ActionController::BadRequest.new("There is no gift with that Id!")
    end

    render json: {
        videoUrl: gift.video.url,
        donorName: gift.donation.donor.name,
        amount: gift.donation.amount,
        charityProject: gift.donation.charity_project
    }, status: :ok
  end
end
