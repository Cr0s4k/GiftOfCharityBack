class Receiver < ApplicationRecord
  has_one :gift, dependent: :restrict_with_error

  def display_name
    self.id
  end
end
