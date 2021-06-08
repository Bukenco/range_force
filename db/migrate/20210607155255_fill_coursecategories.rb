class FillCoursecategories < ActiveRecord::Migration[5.2]
  def up
    CourseCategory.create!(name: "Category A",  id_name: :category_a)
    CourseCategory.create!(name: "Category B",  id_name: :category_b)
    CourseCategory.create!(name: "Category C",  id_name: :category_c)
  end

  def down
    CourseCategory.where(id_name: [:category_a, :category_b, :category_c]).destroy_all
  end
end
