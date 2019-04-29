class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :is_correct, presence: true
end
