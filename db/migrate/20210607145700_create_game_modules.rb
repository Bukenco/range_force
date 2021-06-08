class CreateGameModules < ActiveRecord::Migration[5.2]
  def change
    create_table :game_modules do |t|
      t.references :module_type, foreign_key: true, null: false
      t.references :module_difficulty_type, foreign_key: true, null: false
      t.string :name, limit: 255, null: false
      t.string :description
      t.timestamps
    end
  end
end
