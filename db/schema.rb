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

ActiveRecord::Schema[7.0].define(version: 2024_11_17_222345) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "construction_contents", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_construction_contents_on_site_id"
  end

  create_table "ky_sheets", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "construction_date"
    t.bigint "project_id"
    t.bigint "user_id"
    t.integer "risk_level_id", default: 0, null: false
    t.integer "incidence_rate_id", default: 0, null: false
    t.integer "construction_type_id", default: 0, null: false
    t.index ["project_id"], name: "index_ky_sheets_on_project_id"
    t.index ["user_id"], name: "index_ky_sheets_on_user_id"
  end

  create_table "locations", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id"
    t.string "content", null: false
    t.index ["site_id"], name: "index_locations_on_site_id"
  end

  create_table "projects", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id"
    t.string "name", null: false
    t.string "client"
    t.date "construction_start"
    t.date "construction_completion"
    t.text "construction_content"
    t.index ["site_id"], name: "index_projects_on_site_id"
  end

  create_table "quality_risk_measures", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_quality_risk_measures_on_site_id"
  end

  create_table "quality_risk_predictions", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_quality_risk_predictions_on_site_id"
  end

  create_table "safety_risk_measures", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_safety_risk_measures_on_site_id"
  end

  create_table "safety_risk_predictions", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_safety_risk_predictions_on_site_id"
  end

  create_table "site_risk_measures", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_site_risk_measures_on_site_id"
  end

  create_table "site_risk_predictions", charset: "utf8mb3", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id", null: false
    t.index ["site_id"], name: "index_site_risk_predictions_on_site_id"
  end

  create_table "sites", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "postal_code"
    t.string "address"
    t.index ["name"], name: "index_sites_on_name", unique: true
  end

  create_table "user_sites", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_user_sites_on_site_id"
    t.index ["user_id"], name: "index_user_sites_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "construction_contents", "sites"
  add_foreign_key "ky_sheets", "projects"
  add_foreign_key "ky_sheets", "users"
  add_foreign_key "locations", "sites"
  add_foreign_key "projects", "sites"
  add_foreign_key "quality_risk_measures", "sites"
  add_foreign_key "quality_risk_predictions", "sites"
  add_foreign_key "safety_risk_measures", "sites"
  add_foreign_key "safety_risk_predictions", "sites"
  add_foreign_key "site_risk_measures", "sites"
  add_foreign_key "site_risk_predictions", "sites"
  add_foreign_key "user_sites", "sites"
  add_foreign_key "user_sites", "users"
end
