class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.references :artist, foreign_key: {to_table: :users}, null: false
      t.timestamps
    end
  end
end
