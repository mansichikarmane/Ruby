class ArtworkShare < ApplicationRecord
  # artwork_id
  # viewer_id

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork

  belongs_to :viewers,
  foreign_key: :viewer_id,
  class_name: :User
end