class Enrollment < ApplicationRecord
  validates [:user_id, :course_id], presence: true
  
  belongs_to :student,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  # many to many association
end
