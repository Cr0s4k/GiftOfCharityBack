class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.references :gift
      t.references :donor
      t.references :charity_project

      t.timestamps
    end
  end
end
