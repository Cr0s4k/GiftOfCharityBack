class CharityProject < ApplicationRecord
  has_one :donation, dependent: :restrict_with_error
  belongs_to :questionnaire, optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
