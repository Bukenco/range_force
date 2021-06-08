class AddIndexToGameCourse < ActiveRecord::Migration[5.2]
  def up
    add_index :game_courses, [:course_category_id, :name], unique: true, name: :uniq_courses
  end

  def down
    remove_index :game_courses, name: :uniq_courses
  end
end
