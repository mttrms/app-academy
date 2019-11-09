class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false
      t.references :toyable, polymorphic: true, index: true
      t.timestamps
    end

    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
