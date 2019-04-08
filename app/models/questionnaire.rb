class Questionnaire < ApplicationRecord
  has_many :questions
  has_many :charity_projects
end
