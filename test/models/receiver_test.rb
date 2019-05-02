require 'test_helper'

class ReceiverTest < ActiveSupport::TestCase
  # Validations
  should validate_presence_of(:address)
  should validate_presence_of(:country)
  should validate_presence_of(:province)
  should validate_presence_of(:postcode)
  should validate_presence_of(:city)
  should validate_presence_of(:name)
end
