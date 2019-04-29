class CharityProject < ApplicationRecord
  has_one :donation, dependent: :restrict_with_error
  belongs_to :questionnaire, optional: true
end
