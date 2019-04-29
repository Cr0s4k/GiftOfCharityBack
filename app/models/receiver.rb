class Receiver < ApplicationRecord
  validates :address, presence: true
  validates :country, presence: true
  validates :province, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :name, presence: true
end
