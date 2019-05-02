class NullDonor
  def email
    ''
  end
  def name
    ''
  end
end

class Donation < ApplicationRecord
  cattr_accessor :skip_emails

  belongs_to :charity_project
  belongs_to :donor, dependent: :destroy, optional: true
  belongs_to :gift, dependent: :destroy

  has_one :receiver, through: :gift
  accepts_nested_attributes_for :donor
  accepts_nested_attributes_for :gift

  after_commit :send_email_to_donor

  validates :amount, presence: true

  def get_donor
    self.donor || NullDonor.new
  end
  def get_receiver
    self.receiver || NullReceiver.new
  end

  def send_email_to_donor
    DonationMailer.information(self).deliver_later unless Donation.skip_emails
  end
end
