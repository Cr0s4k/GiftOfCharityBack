class CreateCharityProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :charity_projects do |t|
      t.string :name
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
