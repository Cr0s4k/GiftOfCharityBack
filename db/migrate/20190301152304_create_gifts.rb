class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.boolean :sent
      t.boolean :seen

      t.references :video
      t.references :receiver
      t.timestamps
    end
  end
end
