class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :user, index: true
      t.references :answer_choice, index: true
      t.timestamps
    end
  end
end
