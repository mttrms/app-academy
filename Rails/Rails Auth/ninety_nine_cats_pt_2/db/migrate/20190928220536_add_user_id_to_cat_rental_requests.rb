class AddUserIdToCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :cat_rental_requests, :user, foreign_key: true
  end
end
