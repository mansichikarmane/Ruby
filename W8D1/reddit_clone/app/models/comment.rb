# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  content      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  post_id      :integer
#
# Indexes
#
#  index_comments_on_commenter_id  (commenter_id)
#
class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post

  belongs_to :author,
    foreign_key: :commenter_id,
    class_name: :User

end
