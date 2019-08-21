class CreateHouse < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :address

      t.timestamps
    end
  end
end
