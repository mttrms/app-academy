class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, null: false
      t.references :post, null: false
    end
  end
end
