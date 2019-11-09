class CreateSub < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
