# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_05_225833) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "guest_reviews", force: :cascade do |t|
    t.string "description"
    t.integer "rate"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_guest_reviews_on_user_id"
  end

  create_table "lodging_reviews", force: :cascade do |t|
    t.integer "lodging_id", null: false
    t.integer "user_id", null: false
    t.text "description"
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lodging_id"], name: "index_lodging_reviews_on_lodging_id"
    t.index ["user_id"], name: "index_lodging_reviews_on_user_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.string "location"
    t.text "amenities"
    t.text "facilities"
    t.text "equipment"
    t.date "start_availability"
    t.date "end_availability"
    t.string "photo"
    t.string "video"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lodgings_on_user_id"
  end

  create_table "received_messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "purpose"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "from_user_id"
    t.index ["from_user_id"], name: "index_received_messages_on_from_user_id"
    t.index ["user_id"], name: "index_received_messages_on_user_id"
  end

  create_table "report_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_report_requests_on_user_id"
  end

  create_table "reservation_reviews", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.text "description"
    t.integer "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_reservation_reviews_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "lodging_id", null: false
    t.integer "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "daily_fee"
    t.boolean "confirmation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lodging_id"], name: "index_reservations_on_lodging_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "security_questions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "question"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_security_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "location"
    t.string "current_role"
    t.string "phone_num"
    t.text "bio"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "guest_reviews", "users", on_delete: :cascade
  add_foreign_key "lodging_reviews", "lodgings", on_delete: :cascade
  add_foreign_key "lodging_reviews", "users", on_delete: :cascade
  add_foreign_key "lodgings", "users"
  add_foreign_key "received_messages", "users", column: "from_user_id", on_delete: :cascade
  add_foreign_key "received_messages", "users", on_delete: :cascade
  add_foreign_key "report_requests", "users", on_delete: :cascade
  add_foreign_key "reservation_reviews", "reservations", on_delete: :cascade
  add_foreign_key "reservations", "lodgings", on_delete: :cascade
  add_foreign_key "reservations", "users", on_delete: :cascade
  add_foreign_key "security_questions", "users", on_delete: :cascade
end
