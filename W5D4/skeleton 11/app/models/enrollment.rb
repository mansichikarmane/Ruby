# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  validates :student_id, :course_id, presence: true
  
  belongs_to :students,
    primary_key: :id, # optional
    foreign_key: :student_id,
    class_name: :User
  # many to many association

  belongs_to :courses,
    primary_key: :id, # optional
    foreign_key: :course_id,
    class_name: :Course
end
