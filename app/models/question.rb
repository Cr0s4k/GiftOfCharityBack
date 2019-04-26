class QuestionValidator < ActiveModel::Validator
  def validate(record)
    unless record.answers.select(&:is_correct).count == 1
      record.errors[:answers] << 'There must be a correct answer! (Just one)'
    end
  end
end

class Question < ApplicationRecord
  belongs_to :questionnaire, counter_cache: :number_of_questions
  has_many :answers

  validates :text, presence: true
  validates_presence_of :answers
  accepts_nested_attributes_for :answers

  include ActiveModel::Validations
  validates_with QuestionValidator
end
