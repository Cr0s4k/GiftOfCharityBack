class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :charity_projects

  validates :title, presence: true
  validates_presence_of :questions
  accepts_nested_attributes_for :questions

  def display_name
    self.title
  end
end
