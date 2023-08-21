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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_081910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "checkins", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "paymentMode"
    t.boolean "paid"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gym_id"
    t.index ["gym_id"], name: "index_checkins_on_gym_id"
    t.index ["member_id"], name: "index_checkins_on_member_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_gyms_on_admin_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.string "firstname"
    t.index ["admin_id"], name: "index_members_on_admin_id"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "membership_types", force: :cascade do |t|
    t.string "membership_name"
    t.integer "duration"
    t.integer "price"
    t.bigint "gym_id", null: false
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_membership_types_on_admin_id"
    t.index ["gym_id"], name: "index_membership_types_on_gym_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "membership_type_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_memberships_on_member_id"
    t.index ["membership_type_id"], name: "index_memberships_on_membership_type_id"
  end

  add_foreign_key "checkins", "gyms"
  add_foreign_key "checkins", "members"
  add_foreign_key "gyms", "admins"
  add_foreign_key "members", "admins"
  add_foreign_key "membership_types", "admins"
  add_foreign_key "membership_types", "gyms"
  add_foreign_key "memberships", "members"
  add_foreign_key "memberships", "membership_types"
end
