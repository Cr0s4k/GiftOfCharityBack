require 'test_helper'
require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Donation.skip_emails = true
  end

  test "should make a donation" do
    order_id = make_order(5)
    post donations_make_donation_url(
       orderId: order_id,
       itemId: CharityProject.first.id,
       videoUrl: 'http://somevideo.com',
       address: 'TestAddress',
       city: 'Barcelona',
       country: 'Spain',
       province: 'Barcelona',
       postcode: '08202',
       email: 'test@test.com',
       amount: '5',
       donorName: 'Donor'
     )
    assert_response 200
  end

  test "shouldn't make a donation without order_id" do
    post donations_make_donation_url({})
    assert_response 400
  end

  def make_order(amount)
    client_id = ENV['PAYPAL_CLIENT_ID']
    client_secret = ENV['PAYPAL_CLIENT_SECRET']
    environment = PayPal::SandboxEnvironment.new(client_id, client_secret)

    request = OrdersCreateRequest::new
    request.headers["prefer"] = "return=representation"
    request.request_body({
      intent: 'CAPTURE',
      purchase_units: [
          amount: {
              currency_code: "EUR",
              value: amount
          }
      ]
    })

    response = PayPal::PayPalHttpClient.new(environment).execute(request)
    response[:result][:id]
  end
end
