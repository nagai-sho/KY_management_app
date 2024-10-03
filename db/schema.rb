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

ActiveRecord::Schema[7.0].define(version: 2024_10_03_074713) do
  create_table "construction_contents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_construction_contents_on_site_id"
  end

  create_table "ky_sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "construction_date", null: false
    t.bigint "project_id"
    t.bigint "user_id"
    t.integer "risk_level_id", default: 0, null: false
    t.integer "incidence_rate_id", default: 0, null: false
    t.integer "construction_type_id", default: 0, null: false
    t.index ["project_id"], name: "index_ky_sheets_on_project_id"
    t.index ["user_id"], name: "index_ky_sheets_on_user_id"
  end

  create_table "locations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content", null: false
    t.bigint "site_id"
    t.index ["site_id"], name: "index_locations_on_site_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "client"
    t.date "construction_start"
    t.date "construction_completion"
    t.text "construction_content"
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_projects_on_site_id"
  end

  create_table "quality_risk_measures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_quality_risk_measures_on_site_id"
  end

  create_table "quality_risk_predictions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_quality_risk_predictions_on_site_id"
  end

  create_table "safety_risk_measures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_safety_risk_measures_on_site_id"
  end

  create_table "safety_risk_predictions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_safety_risk_predictions_on_site_id"
  end

  create_table "site_risk_measures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_site_risk_measures_on_site_id"
  end

  create_table "site_risk_predictions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_site_risk_predictions_on_site_id"
  end

  create_table "sites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "postal_code"
    t.string "address"
    t.index ["name"], name: "index_sites_on_name", unique: true
  end

  create_table "user_sites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_user_sites_on_site_id"
    t.index ["user_id"], name: "index_user_sites_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "company", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "phone_number", null: false
    t.string "position", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "construction_contents", "sites"
  add_foreign_key "ky_sheets", "projects"
  add_foreign_key "ky_sheets", "users"
  add_foreign_key "locations", "sites"
  add_foreign_key "quality_risk_measures", "sites"
  add_foreign_key "quality_risk_predictions", "sites"
  add_foreign_key "safety_risk_measures", "sites"
  add_foreign_key "safety_risk_predictions", "sites"
  add_foreign_key "site_risk_measures", "sites"
  add_foreign_key "site_risk_predictions", "sites"
  add_foreign_key "user_sites", "sites"
  add_foreign_key "user_sites", "users"
end
