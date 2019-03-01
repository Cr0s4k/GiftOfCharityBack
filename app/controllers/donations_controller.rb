require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsController < ApplicationController
  def make_donation
    order_id = donation_params
    begin
      verify_order(order_id)
      video = Video.create(url: "asda")
      receiver = Receiver.create({
                                     address: "asd",
                                     country: "asd",
                                     province: "asd",
                                     postcode: 213,
                                     city: "string"
                                 })
      gift = Gift.create({
                             sent: false,
                             seen: false,
                             video_id: video.id,
                             receiver_id: receiver.id
                         })
      donor = Donor.create(email: "Blablabla")
      donation = Donation.create({
                                     amount: 10,
                                     donor_id: donor.id,
                                     gift_id: gift.id,
                                     charity_project_id: 1
                                 })

      render json:donation, status: :ok
    rescue Exception => e
      render json:{message: e.to_s}, status: :payment_required
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
    params.require(:orderId)
  end
end
