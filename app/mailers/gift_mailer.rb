class GiftMailer < ApplicationMailer
  def seen_gift_email(gift)
    @gift = gift
    mail to: gift.donation.donor.email, subject: "#{gift.receiver.name} has opened your gift!"
  end
end
