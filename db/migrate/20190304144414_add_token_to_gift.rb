class AddTokenToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :token, :string
    add_column :gifts, :secret_url, :string
  end
end
