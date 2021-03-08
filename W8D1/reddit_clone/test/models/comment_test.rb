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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
