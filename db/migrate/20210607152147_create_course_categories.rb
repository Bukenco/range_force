class CreateCourseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :course_categories do |t|
      t.string :name,         null: false
      t.string :id_name,      null: false, limit: 100
      t.timestamps
    end
  end
end
