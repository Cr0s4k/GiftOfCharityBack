class Donation < ApplicationRecord
  belongs_to :charity_project
  belongs_to :donor, dependent: :destroy
  belongs_to :gift, dependent: :destroy
  accepts_nested_attributes_for :donor
  accepts_nested_attributes_for :gift
end
