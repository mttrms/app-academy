class AddUserToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :user
  end
end
