require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Associations
  should belong_to(:question)

  # Validations
  should validate_presence_of(:text)
  should validate_presence_of(:is_correct)
end
