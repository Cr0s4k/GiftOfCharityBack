class GiftsController < ApiController
  def index
    token = params[:token]
    if token.nil?
      raise ActionController::ParameterMissing.new("token") # Bad_request
    end
    gift = Gift.find_by(token: token)
    if gift.nil?
      raise ActionController::BadRequest.new("There is no gift with that Id!") # 400
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

  private
  # Format for Quick-quiz
  def format_questionnaire(questionnaire)
    {
        title: questionnaire.title,
        questions: questionnaire.questions.each_with_index.map do |question, i|
          {
              number: i + 1,
              prompt: question.text,
              answers: question.answers.map(&:text),
              correct: {
                  index: question.answers.each_with_index.find { |answer, _|
                    answer.is_correct
                  }[1]
              }
          }
        end
    }
  end
end
