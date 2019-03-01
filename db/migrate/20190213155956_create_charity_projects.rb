class CreateCharityProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :charity_projects do |t|
      t.string :name
      t.integer :price
      t.string :imageUrl
      t.belongs_to :donation, index:true

      t.timestamps
    end
  end
end
