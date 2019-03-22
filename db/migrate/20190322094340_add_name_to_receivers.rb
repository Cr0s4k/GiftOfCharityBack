class AddNameToReceivers < ActiveRecord::Migration[5.1]
  def change
    add_column :receivers, :name, :string
  end
end
