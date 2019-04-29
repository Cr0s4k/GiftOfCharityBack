require 'test_helper'

class DonorTest < ActiveSupport::TestCase
  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:email)
end
