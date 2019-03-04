class Donation < ApplicationRecord
  belongs_to :charity_project
  belongs_to :donor
  belongs_to :gift
end
