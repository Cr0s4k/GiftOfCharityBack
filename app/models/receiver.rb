class Receiver < ApplicationRecord
  def display_name
    self.id
  end
end
