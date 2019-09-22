class ArtworkShare < ApplicationRecord
  belongs_to :artwork
  belongs_to :viewer,
    class_name: "User",
    foreign_key: "viewer_id"
end
