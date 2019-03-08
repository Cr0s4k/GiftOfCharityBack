module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from ActionController::BadRequest, with: :bad_request
  end

  def render_error(msg, status)
    render json: {
        message: msg
    }, status: status
  end

  def not_found(e)
    render_error(e.to_s, :not_found)
  end

  def parameter_missing(e)
    render_error(e.to_s, :bad_request)
  end

  def bad_request(e)
    render_error(e.to_s, :bad_request)
  end
end

