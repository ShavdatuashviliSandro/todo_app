# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_18_202925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, where: "(active IS TRUE)"
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "name", limit: 255, null: false
    t.index ["country_id", "name"], name: "index_cities_on_country_id_and_name", unique: true
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "customer_tasks", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "task_id", null: false
    t.index ["customer_id"], name: "index_customer_tasks_on_customer_id"
    t.index ["task_id"], name: "index_customer_tasks_on_task_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
  end

  create_table "datunas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", limit: 255, null: false
    t.text "body", null: false
    t.datetime "published_at"
    t.datetime "scheduled_at"
    t.string "cancellation_reason"
    t.bigint "moderator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status_state"
    t.index ["moderator_id"], name: "index_posts_on_moderator_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_id"
    t.string "product_type"
    t.decimal "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.bigint "user_id", null: false
    t.string "phone_number", limit: 20
    t.date "birth_date"
    t.text "about_me"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", limit: 150
    t.string "format", limit: 50
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false, null: false
    t.index ["title"], name: "index_projects_on_title", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "title", null: false
    t.boolean "done", default: false, null: false
    t.text "tags", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "username", limit: 255, null: false
    t.string "pin", limit: 11, null: false
    t.bigint "country_id", null: false
    t.bigint "city_id", null: false
    t.boolean "terms_of_use", default: false, null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pin"], name: "index_users_on_pin", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "customer_tasks", "customers"
  add_foreign_key "customer_tasks", "tasks"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "users", column: "moderator_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "countries"
end
