class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :capy_id
      t.string :party_id
      t.timestamps null: false
    end

    add_index :attendances, :capy_id
    add_index :attendances, [:party_id, :capy_id], unique: true
  end
end
