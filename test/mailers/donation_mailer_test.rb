require 'test_helper'

class DonationMailerTest < ActionMailer::TestCase
  test "information email" do
    donation = donations(:one)
    mail = DonationMailer.information(donation)
    assert_equal "Donation Information", mail.subject
    assert_equal [donation.donor.email], mail.to
    assert_equal ["admin@#{ENV['BACKEND_HEROKU_APP']}.herokuapp.com"], mail.from
    assert_match donation.amount.to_s, mail.body.encoded
    assert_match donation.donor.email, mail.body.encoded
  end
end
