class FillModuleDifficultyTypes < ActiveRecord::Migration[5.2]
  def up
    ModuleDifficultyType.create!(name: "A",  id_name: :a)
    ModuleDifficultyType.create!(name: "B",  id_name: :b)
    ModuleDifficultyType.create!(name: "C",  id_name: :c)
  end

  def down
    ModuleDifficultyType.where(id_name: [:a, :b, :c]).destroy_all
  end
end
