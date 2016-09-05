# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160905064016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "bank_informations", force: :cascade do |t|
    t.string   "currency"
    t.string   "country"
    t.string   "name"
    t.string   "routing_number"
    t.string   "account_number"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wifi_id"
    t.datetime "disconnected_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "download_data",   default: 0.0
    t.float    "upload_data",     default: 0.0
    t.datetime "connected_at"
    t.float    "total_bill",      default: 0.0
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.string   "card_number"
    t.datetime "expiry"
    t.string   "cvn"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rate"
    t.integer  "connection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "password_digest"
    t.boolean  "email_verified",          default: false
    t.boolean  "number_verified",         default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "terminated_successfully", default: true
    t.boolean  "blocked",                 default: false
  end

  create_table "verifications", force: :cascade do |t|
    t.string   "mob_verification_code"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "email_token"
    t.string   "forgot_password_token"
  end

  add_index "verifications", ["user_id"], name: "index_verifications_on_user_id", using: :btree

  create_table "wifis", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.string   "address"
    t.string   "name"
    t.string   "password"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ssid"
    t.string   "security_type"
    t.float    "price",         default: 0.0
    t.integer  "avg_speed"
  end

  add_index "wifis", ["user_id"], name: "index_wifis_on_user_id", using: :btree

  add_foreign_key "api_keys", "users"
  add_foreign_key "verifications", "users"
  add_foreign_key "wifis", "users"
end
