class AddSkillToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :skill, :string
  end
end
