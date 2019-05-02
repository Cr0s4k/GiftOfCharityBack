require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  # Associations
  should have_many(:questions).dependent(:destroy)
  should have_many(:charity_projects).dependent(:nullify)

  # Validations
  should validate_presence_of(:title)
  should validate_presence_of(:number_of_questions)
end
