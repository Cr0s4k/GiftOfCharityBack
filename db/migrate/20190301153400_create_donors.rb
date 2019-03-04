class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :email
      t.string :string

      t.timestamps
    end
  end
end
