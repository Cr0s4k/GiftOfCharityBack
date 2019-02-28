require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsController < ApplicationController
  def verify_order
    p params
    order_id = params[:orderId]

    client_id = 'ATlmGDAnnY0o4-9pXPaMQDitSgsXY_O5U5VnZ4tZkijURbwSKJmM6YWG_5Znyk6Bs41BN1SaJu7NNVJ0'
    client_secret = 'EDy5PHFLpsjcPm7xVC-RdeWdNs05k7oFeiIIYLmKxCbJ6XNx075qmI9yQE4q1Tcp10fAfh50Xa53Y1h1'
    environtment = PayPal::SandboxEnvironment.new(client_id, client_secret)
    request = OrdersGetRequest::new(order_id)

    response = PayPal::PayPalHttpClient.new(environtment).execute(request)
    amount = response[:result]["purchase_units"][0]["amount"]["value"]
    if amount.to_f != params[:amount].to_f
      raise Exception "Different amounts"
    end
    render status: 200
  rescue
    render json: {}, status: 400
  end
end
