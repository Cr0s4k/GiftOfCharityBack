class GiftController < ApplicationController
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
        videoUrl: gift.video.url
    }, status: :ok
  end
end
