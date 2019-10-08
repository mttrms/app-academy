class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.timestamps
    end
  end
end
