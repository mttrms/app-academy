class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.string :text
      t.references :question, index:true
      t.timestamps
    end
  end
end
