class CreateGameCourseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :game_course_modules do |t|
      t.references :game_course,foreign_key: true, null: false
      t.references :game_module,foreign_key: true, null: false
      t.boolean :is_active, null: false, default: true
    end

    add_index :game_course_modules, [:game_course_id, :game_module_id], unique: true
  end
end
