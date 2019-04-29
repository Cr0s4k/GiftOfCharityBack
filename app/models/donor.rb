class Donor < ApplicationRecord
  has_one :donation

  validates :email, presence: true
  validates :name, presence: true
end
