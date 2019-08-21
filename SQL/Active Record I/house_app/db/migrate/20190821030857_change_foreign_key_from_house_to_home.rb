class ChangeForeignKeyFromHouseToHome < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :house_id, :home_id
  end
end
