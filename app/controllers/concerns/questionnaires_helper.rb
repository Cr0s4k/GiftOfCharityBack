module QuestionnairesHelper
  # Format for Quick-quiz
  def format_questionnaire(questionnaire)
    return nil if questionnaire.nil?
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
