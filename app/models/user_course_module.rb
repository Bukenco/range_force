class UserCourseModule < ApplicationRecord
  belongs_to :user_account
  belongs_to :game_course_module
end
