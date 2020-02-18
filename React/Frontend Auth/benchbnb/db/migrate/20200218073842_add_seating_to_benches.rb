class AddSeatingToBenches < ActiveRecord::Migration[6.0]
  def change
    add_column :benches, :seating, :integer
  end
end
