class QuestionValidator < ActiveModel::Validator
  def validate(record)
    p record.answers
    unless record.answers.select(&:is_correct).count == 1
      record.errors[:answers] << 'There must be a correct answer! (Just one)'
    end
  end
end

class Question < ApplicationRecord
  belongs_to :questionnaire, counter_cache: :number_of_questions
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates_presence_of :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  include ActiveModel::Validations
  validates_with QuestionValidator
end
