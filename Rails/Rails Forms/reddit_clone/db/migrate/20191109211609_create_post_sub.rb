class CreatePostSub < ActiveRecord::Migration[6.0]
  def change
    create_table :post_subs do |t|
      t.references :post, null: false
      t.references :sub, null: false
      t.timestamps
    end
  end
end
