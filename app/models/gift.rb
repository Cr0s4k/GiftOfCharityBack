class Gift < ApplicationRecord
  belongs_to :receiver
  belongs_to :video
end
