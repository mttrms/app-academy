class Home < ApplicationRecord
  has_many :residents,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Person
end
