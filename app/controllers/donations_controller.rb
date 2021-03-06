require 'paypal-checkout-sdk'
include PayPalCheckoutSdk::Orders

class DonationsController < ApiController
  def create
    order_id = donation_params['orderId']
    if donation_params['orderId'].blank?
      raise ActionController::ParameterMissing.new("orderId")
    end
    begin
      verify_order(order_id)
    rescue Exception => e
      render json: {message: e.to_s}, status: :payment_required
      return
    end
    receiver = Receiver.create(
        name: donation_params['receiverName'],
        address: donation_params['address'],
        country: donation_params['country'],
        province: donation_params['province'],
        postcode: donation_params['postcode'],
        city: donation_params['city']
    )
    gift = Gift.create(
        sent: false,
        seen: false,
        receiver: receiver,
        video_url: donation_params['videoUrl']
    )
    donor = Donor.create(
        email: donation_params['email'],
        name: donation_params['donorName']
    )
    donation = Donation.create(
        amount: donation_params['amount'],
        donor: donor,
        gift: gift,
        charity_project_id: donation_params['itemId']
    )
    render json: donation, status: :ok
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
    params.permit(:orderId,
                  :videoUrl,
                  :address,
                  :city, :country,
                  :province,
                  :postcode,
                  :email,
                  :itemId,
                  :amount,
                  :donorName,
                  :receiverName)
  end
end
