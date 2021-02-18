class Course < ApplicationRecord
  validates
  
  has_many :students,
  through: :enrollments,
  source: :user
end
