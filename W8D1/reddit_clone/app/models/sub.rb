# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  description  :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer
#
class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User

  belongs_to :postsub, 
    foreign_key: :sub_id,
    class_name: :PostSub

  has_many :posts, 
    through: :postsub,
    source: :subs

end
