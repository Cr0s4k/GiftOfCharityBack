# Preview all emails at http://localhost:3000/rails/mailers/gift_mailer
class GiftMailerPreview < ActionMailer::Preview
  def seen_gift_email
    receiver = Receiver.create(
        name: 'Takeshi',
        address: 'Calle Quevedo 63',
        country: 'Spain',
        province: 'Barcelona',
        postcode: '08202',
        city: 'Sabadell'
    )
    gift = Gift.create(
        sent: false,
        seen: false,
        video_url: 'http://google.es',
        receiver: receiver
    )
    donor = Donor.create(email: 'omarcruz11@hotmail.com', name: 'Omar')
    charity_project = CharityProject.create(
        name: 'Save the ocean',
        image_url: 'http://image.com',
        description: 'Description'
    )
    Donation.create(
        amount: 10000,
        donor: donor,
        gift: gift,
        charity_project: charity_project
    )

    GiftMailer.seen_gift_email(gift)
  end
end
