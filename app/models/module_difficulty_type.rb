class ModuleDifficultyType < ApplicationRecord
  validates :name, presence: true
  validates :id_name, presence: true
end
