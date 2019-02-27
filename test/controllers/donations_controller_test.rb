require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  test "should get verify_order" do
    get donations_verify_order_url
    assert_response :success
  end

end
