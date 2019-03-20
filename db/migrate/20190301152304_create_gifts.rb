class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.boolean :sent
      t.boolean :seen
      t.string :token
      t.string :secret_url
      t.string :video_url

      t.references :receiver
      t.timestamps
    end
  end
end
