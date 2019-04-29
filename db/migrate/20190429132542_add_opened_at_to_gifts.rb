class AddOpenedAtToGifts < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :opened_at, :datetime
  end
end
