class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :done, null: false
      t.references :todo, foreign_key: true, null: false
    end
  end
end
