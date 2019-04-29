require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
end
