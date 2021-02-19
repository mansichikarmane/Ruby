# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :name, presence: true #some stuff

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses, # creates an instance method
    through: :enrollments,
    source: :courses
end


#some way to delineate between students and instructors
#add two columns one for student_id one for instructor id
