require 'active_record/fixtures'
# Preview all emails at http://localhost:3000/rails/mailers/donation_mailer
class DonationMailerPreview < ActionMailer::Preview
  def information
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
        video_url: 'http://google.es',
        receiver: receiver
    )
    donor = Donor.create(email: 'omarcruz11@hotmail.com')
    charity_project = CharityProject.create(
        name: 'charity test',
        image_url: 'http://image.com',
        description: 'Description'
    )
    donation = Donation.create(
        amount: 10000,
        donor: donor,
        gift: gift,
        charity_project: charity_project
    )
    DonationMailer.information(donation)
  end
end
