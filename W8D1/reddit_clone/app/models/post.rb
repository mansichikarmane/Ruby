class Post < ApplicationRecord
  validates :title, presence: true
  validates :url, :content, allow_nil: true

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
end