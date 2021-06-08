class CreateUserCourseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :user_course_modules do |t|
      t.references :user_account,foreign_key: true, null: false
      t.references :game_course_module,foreign_key: true, null: false
      t.timestamps
    end
  end
end
