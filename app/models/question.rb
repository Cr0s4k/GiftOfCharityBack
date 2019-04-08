class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers

  validates_presence_of :answers
  accepts_nested_attributes_for :answers
end
