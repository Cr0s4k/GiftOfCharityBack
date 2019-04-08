class AddQuestionnaireToCharityProjets < ActiveRecord::Migration[5.1]
  def change
    add_reference :charity_projects, :questionnaire, foreign_key: true
  end
end
