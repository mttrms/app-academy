class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :poll, index: true
      t.timestamps
    end
  end
end
