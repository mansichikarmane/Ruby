class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, { scope: :artist_id }, uniqueness: true
end