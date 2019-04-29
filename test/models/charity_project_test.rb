require 'test_helper'

class CharityProjectTest < ActiveSupport::TestCase
  # Associations
  should belong_to(:questionnaire).optional

  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:image_url)
end
