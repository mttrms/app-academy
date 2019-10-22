class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details, null: false
      t.boolean :private, default: false
      t.boolean :completed, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
