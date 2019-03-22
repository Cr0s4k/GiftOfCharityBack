class CharityProject < ApplicationRecord
  has_one :donation, dependent: :restrict_with_error
end
