# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_07_215116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "id_name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_course_modules", force: :cascade do |t|
    t.bigint "game_course_id", null: false
    t.bigint "game_module_id", null: false
    t.boolean "is_active", default: true, null: false
    t.index ["game_course_id", "game_module_id"], name: "index_game_course_modules_on_game_course_id_and_game_module_id", unique: true
    t.index ["game_course_id"], name: "index_game_course_modules_on_game_course_id"
    t.index ["game_module_id"], name: "index_game_course_modules_on_game_module_id"
  end

  create_table "game_courses", force: :cascade do |t|
    t.bigint "course_category_id", null: false
    t.string "name", limit: 255, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_category_id", "name"], name: "uniq_courses", unique: true
    t.index ["course_category_id"], name: "index_game_courses_on_course_category_id"
  end

  create_table "game_modules", force: :cascade do |t|
    t.bigint "module_type_id", null: false
    t.bigint "module_difficulty_type_id", null: false
    t.string "name", limit: 255, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["module_difficulty_type_id"], name: "index_game_modules_on_module_difficulty_type_id"
    t.index ["module_type_id", "module_difficulty_type_id", "name"], name: "uniq_modules", unique: true
    t.index ["module_type_id"], name: "index_game_modules_on_module_type_id"
  end

  create_table "module_difficulty_types", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "id_name", limit: 50, null: false
  end

  create_table "module_types", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "id_name", limit: 50, null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.string "username", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_course_modules", force: :cascade do |t|
    t.bigint "user_account_id", null: false
    t.bigint "game_course_module_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_course_module_id"], name: "index_user_course_modules_on_game_course_module_id"
    t.index ["user_account_id"], name: "index_user_course_modules_on_user_account_id"
  end

  add_foreign_key "game_course_modules", "game_courses"
  add_foreign_key "game_course_modules", "game_modules"
  add_foreign_key "game_courses", "course_categories"
  add_foreign_key "game_modules", "module_difficulty_types"
  add_foreign_key "game_modules", "module_types"
  add_foreign_key "user_course_modules", "game_course_modules"
  add_foreign_key "user_course_modules", "user_accounts"
end
