class Questionnaire < ApplicationRecord
  has_many :questions
  has_many :charity_projects

  validates_presence_of :questions
  accepts_nested_attributes_for :questions
end
