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

ActiveRecord::Schema.define(version: 20170918035645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.datetime "date"
    t.integer  "caloricIntake"
    t.integer  "waterIntake"
    t.integer  "slept"
    t.integer  "workout"
    t.integer  "weeklygoal"
    t.integer  "weeklyweight"
    t.integer  "weightlost"
    t.integer  "weightgain"
    t.integer  "bonusPoints"
    t.integer  "totalPoints"
    t.integer  "weeklyPoints"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "weeklyLog"
    t.datetime "dailyLog"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "LastName"
    t.integer  "startWeight"
    t.integer  "goalWeight"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "logs_id"
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["logs_id"], name: "index_users_on_logs_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "logs", "users"
  add_foreign_key "users", "logs", column: "logs_id"
end
