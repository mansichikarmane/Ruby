class PostSub < ApplicationRecord

  validates :post_id, :sub_id, presence: true, uniqueness: true

  belongs_to  :posts, 
    foreign_key: :post_id,
    class_name: :Post

  belongs_to :subs, 
    foreign_key: :sub_id,
    class_name: :Sub



end