require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  # Associations
  should belong_to(:charity_project)
  should belong_to(:donor).dependent(:destroy).optional
  should belong_to(:gift).dependent(:destroy)

  # Validations
  should validate_presence_of(:amount)
end
