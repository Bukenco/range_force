class UserAccount < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :username,   presence: true

  has_many :user_course_modules
end
