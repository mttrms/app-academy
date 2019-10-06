class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, null: false, default: false
      t.references :band, null: false, foreign_key: true
      t.timestamps
    end
  end
end
