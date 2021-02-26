require "action_view"
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ['orange', 'black', 'white', 'gray']
  SEXES = ['M', 'F']
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: {in: COLORS}
  validates :sex, inclusion: {in: SEXES}

  def age
    Date.now - self.birth_date
  end
end
