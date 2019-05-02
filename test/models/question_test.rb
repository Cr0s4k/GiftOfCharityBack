require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # Associations
  should have_many(:answers).dependent(:destroy)
  should belong_to(:questionnaire).counter_cache(:number_of_questions)

  # Validations
  should validate_presence_of(:text)
end
