class AddNumberOfQuestionsToQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :number_of_questions, :integer, default: 0
  end
end
