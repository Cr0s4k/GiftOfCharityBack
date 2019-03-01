require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsController < ApplicationController
  def make_donation
    order_id = donation_params
    begin
      verify_order(order_id)
    rescue Exception
      render json:{message: 'Error paying'}, status: :payment_required
      return
    end
    render json:{}, status: :ok
  end

  private
  def verify_order(order_id)
    client_id = ENV['PAYPAL_CLIENT_ID']
    client_secret = ENV['PAYPAL_CLIENT_SECRET']
    environment = PayPal::SandboxEnvironment.new(client_id, client_secret)

    request = OrdersGetRequest::new(order_id)
    response = PayPal::PayPalHttpClient.new(environment).execute(request)

    amount = response[:result]["purchase_units"][0]["amount"]["value"]

    if amount.to_f <= 1
      raise "Invalid payment"
    end
  end

  def donation_params
    params.require(:orderId)
  end
end
