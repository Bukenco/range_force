class CreateModuleDifficultyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :module_difficulty_types do |t|
      t.string :name,    limit: 255, null: false
      t.string :id_name, limit: 50, null: false
    end
  end
end
