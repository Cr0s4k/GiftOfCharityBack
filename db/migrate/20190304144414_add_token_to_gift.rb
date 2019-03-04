class AddTokenToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :token, :string
  end
end
