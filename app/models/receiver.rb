class Receiver < ApplicationRecord
  has_one :gift, dependent: :restrict_with_error
end
