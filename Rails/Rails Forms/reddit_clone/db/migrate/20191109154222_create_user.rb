class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_hash
      t.string :session_token
      t.timestamps
    end

    add_index :users, :username
  end
end
