class NullDonor
  def email
    ''
  end
  def name
    ''
  end
end

class Donation < ApplicationRecord
  belongs_to :charity_project
  belongs_to :donor, dependent: :destroy
  belongs_to :gift, dependent: :destroy

  has_one :receiver, through: :gift
  accepts_nested_attributes_for :donor
  accepts_nested_attributes_for :gift

  def donor
    super || NullDonor.new
  end
end
