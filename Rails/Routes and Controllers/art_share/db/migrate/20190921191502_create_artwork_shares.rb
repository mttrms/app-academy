class CreateArtworkShares < ActiveRecord::Migration[6.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, foreign_key: true, null: false
      t.references :viewer, foreign_key: {to_table: :users}, null: false
      t.index [:artwork_id, :viewer_id], unique: true
      t.timestamps
    end
  end
end
