# == Schema Information
#
# Table name: posts
#
#  id        :bigint           not null, primary key
#  content   :string
#  title     :string
#  url       :string
#  author_id :integer
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
class Post < ApplicationRecord
  validates :title, presence: true
  validates :url, :content, allow_nil: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :subs, 
    through: :postsub,
    source: :posts

  belongs_to :postsub,
    foreign_key: :post_id,
    class_name: :PostSub

  has_many :comments,
    foreign_key: :post_id,
    class_name: :Comment
  
end
