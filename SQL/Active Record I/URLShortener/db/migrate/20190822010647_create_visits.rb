class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :user, index:true
      t.references :shortened_url, index:true
      t.timestamps
    end
  end
end
