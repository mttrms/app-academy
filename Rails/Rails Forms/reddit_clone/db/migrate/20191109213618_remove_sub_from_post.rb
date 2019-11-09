class RemoveSubFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :sub_id
  end
end
