class GameCourse < ApplicationRecord
  validates :name, presence: true

  belongs_to :course_category

  has_many :game_course_modules
end
