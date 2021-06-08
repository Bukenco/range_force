class GameCourseModule < ApplicationRecord
  belongs_to :game_course
  belongs_to :game_module

  has_many :user_course_modules
end
