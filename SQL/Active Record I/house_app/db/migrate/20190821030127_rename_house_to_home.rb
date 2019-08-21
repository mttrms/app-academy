class RenameHouseToHome < ActiveRecord::Migration[6.0]
  def change
    rename_table :houses, :homes
  end
end
