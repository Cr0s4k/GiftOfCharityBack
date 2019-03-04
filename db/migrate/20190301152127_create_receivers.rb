class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :address
      t.string :country
      t.string :province
      t.integer :postcode
      t.string :city

      t.timestamps
    end
  end
end
