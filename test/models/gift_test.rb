require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  # Associations
  should have_one(:donation).optional
  should belong_to(:receiver).dependent(:destroy).optional

  # Validations
  should validate_presence_of(:video_url)
end
