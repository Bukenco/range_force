class FillModuleTypes < ActiveRecord::Migration[5.2]
  def up
    ModuleType.create!(name: "Hands-on",  id_name: :hands_on)
    ModuleType.create!(name: "Theory",    id_name: :theory)
    ModuleType.create!(name: "Practice",  id_name: :practice)
  end

  def down
    ModuleType.where(id_name: [:hands_on, :theory, :practice]).destroy_all
  end
end
