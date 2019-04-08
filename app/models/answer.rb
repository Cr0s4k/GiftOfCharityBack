class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true

  scope :correct_ones, -> {where(is_correct: true)}
end
