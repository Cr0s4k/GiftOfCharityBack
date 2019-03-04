require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsController < ApplicationController
  def make_donation
    order_id = donation_params['orderId']
    begin
      verify_order(order_id)
      video = Video.create(url: donation_params['videoUrl'])
      receiver = Receiver.create(
          address: donation_params['address'],
          country: donation_params['country'],
          province: donation_params['province'],
          postcode: donation_params['postcode'],
          city: donation_params['city']
      )
      gift = Gift.create(
          sent: false,
          seen: false,
          video: video,
          receiver: receiver
      )
      donor = Donor.create(email: donation_params['email'])
      donation = Donation.create(
          amount: donation_params['amount'],
          donor: donor,
          gift: gift,
          charity_project_id: donation_params['itemId']
      )

      render json: donation, status: :ok
    rescue Exception => e
      render json: {message: e.to_s}, status: :payment_required
      return
    end
  end

  private

  def verify_order(order_id)
    client_id = ENV['PAYPAL_CLIENT_ID']
    client_secret = ENV['PAYPAL_CLIENT_SECRET']
    environment = PayPal::SandboxEnvironment.new(client_id, client_secret)

    request = OrdersGetRequest::new(order_id)
    response = PayPal::PayPalHttpClient.new(environment).execute(request)

    amount = response[:result]["purchase_units"][0]["amount"]["value"]

    if amount.to_f < 1
      raise "Invalid payment"
    end
  end

  def donation_params
    params.permit(:orderId, :videoUrl, :address, :city, :country, :province, :postcode, :email, :itemId)
  end
end
