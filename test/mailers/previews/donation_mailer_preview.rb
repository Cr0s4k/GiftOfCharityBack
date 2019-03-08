require 'active_record/fixtures'
# Preview all emails at http://localhost:3000/rails/mailers/donation_mailer
class DonationMailerPreview < ActionMailer::Preview
  def information
    video = Video.create(url: 'http://google.es')
    receiver = Receiver.create(
        address: 'Calle Quevedo 63',
        country: 'Spain',
        province: 'Barcelona',
        postcode: '08202',
        city: 'Sabadell'
    )
    gift = Gift.create(
        sent: false,
        seen: false,
        video: video,
        receiver: receiver
    )
    donor = Donor.create(email: 'omarcruz11@hotmail.com')
    donation = Donation.create(
        amount: 10000,
        donor: donor,
        gift: gift,
        charity_project_id: 1
    )
    DonationMailer.information(donation)
  end
end
