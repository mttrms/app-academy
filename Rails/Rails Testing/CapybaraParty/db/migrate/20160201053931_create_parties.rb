class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :capy_id, null: false
      t.string :occasion, null: false
      t.timestamps null: false
    end

    add_index :parties, :capy_id
  end
end
