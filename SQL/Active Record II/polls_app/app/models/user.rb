# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :authored_polls,
    class_name: "Poll"
  has_many :responses

  validates :username, presence: true, uniqueness: true
end
