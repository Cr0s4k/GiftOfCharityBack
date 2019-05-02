class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :charity_projects, dependent: :nullify

  validates :title, presence: true
  validates_presence_of :number_of_questions
  validates_presence_of :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  def display_name
    self.title
  end
end
