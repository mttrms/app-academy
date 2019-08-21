class Person < ApplicationRecord
  belongs_to :home,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Home
end
