class GameModule < ApplicationRecord
  validates :name, presence: true

  belongs_to :module_type
  belongs_to :module_difficulty_type

  has_many :game_course_modules
end
