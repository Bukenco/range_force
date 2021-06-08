class CreateGameCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :game_courses do |t|
      t.references :course_category, foreign_key: true, null: false
      t.string :name, limit: 255, null: false
      t.string :description
      t.timestamps
    end
  end
end
