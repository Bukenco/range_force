class AddIndexToGameModule < ActiveRecord::Migration[5.2]
  def up
    add_index :game_modules, [:module_type_id, :module_difficulty_type_id, :name], unique: true, name: :uniq_modules
  end

  def down
    remove_index :game_modules, name: :uniq_modules
  end
end