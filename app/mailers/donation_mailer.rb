class DonationMailer < ApplicationMailer
  def information(donation)
    @donation = donation
    mail to: donation.donor.email, subject: 'Donation Information'
  end
end
