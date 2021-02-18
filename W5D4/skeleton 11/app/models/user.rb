class User < ApplicationRecord
  validates

  has_many :courses,
  through: :enrollments,
  source: :course
end
