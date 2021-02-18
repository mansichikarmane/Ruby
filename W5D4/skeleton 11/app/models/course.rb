# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # add_index :course, :course_id, options
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment
  
  has_many :students, 
  through: :enrollments, #always association names in current class
  source: :students #where the through gets us
end
