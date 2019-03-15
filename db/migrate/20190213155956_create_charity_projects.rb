class CreateCharityProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :charity_projects do |t|
      t.string :name
      t.string :image_url
      t.belongs_to :donation, index:true

      t.timestamps
    end
  end
end
