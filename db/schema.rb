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

ActiveRecord::Schema.define(version: 20171222174935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.date     "date"
    t.boolean  "goalMet"
    t.integer  "foodPoint"
    t.integer  "foodGoal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "log_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_foods_on_goal_id", using: :btree
    t.index ["log_id"], name: "index_foods_on_log_id", using: :btree
    t.index ["user_id"], name: "index_foods_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "waterGoal"
    t.integer  "waterPoint"
    t.integer  "weightGoal"
    t.integer  "weightPoint"
    t.integer  "sleepPoint"
    t.integer  "sleepGoal"
    t.integer  "workoutGoal"
    t.integer  "workoutPoint"
    t.integer  "foodPoint"
    t.integer  "foodGoal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "logs_id"
    t.index ["logs_id"], name: "index_goals_on_logs_id", using: :btree
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "logs", force: :cascade do |t|
    t.date     "date"
    t.string   "water"
    t.string   "sleep"
    t.string   "workout"
    t.string   "food"
    t.string   "goal"
    t.integer  "point"
    t.integer  "totalPoints"
    t.integer  "weightStatus"
    t.boolean  "weeklyGoalMet"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_logs_on_goal_id", using: :btree
    t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
  end

  create_table "sleeps", force: :cascade do |t|
    t.date     "date"
    t.boolean  "goalMet"
    t.integer  "sleepGoal"
    t.integer  "sleepPoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "log_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_sleeps_on_goal_id", using: :btree
    t.index ["log_id"], name: "index_sleeps_on_log_id", using: :btree
    t.index ["user_id"], name: "index_sleeps_on_user_id", using: :btree
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
    t.string   "username"
    t.integer  "logs_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["logs_id"], name: "index_users_on_logs_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "waters", force: :cascade do |t|
    t.date     "date"
    t.integer  "waterDrank"
    t.integer  "waterGoal"
    t.integer  "point"
    t.boolean  "goalMet"
    t.integer  "waterPoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "log_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_waters_on_goal_id", using: :btree
    t.index ["log_id"], name: "index_waters_on_log_id", using: :btree
    t.index ["user_id"], name: "index_waters_on_user_id", using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.date     "date"
    t.boolean  "goalMet"
    t.integer  "hours"
    t.integer  "workoutPoint"
    t.integer  "points"
    t.string   "workoutType"
    t.integer  "caloriesBurned"
    t.time     "workoutTime"
    t.integer  "workedoutTime"
    t.integer  "workoutGoal"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "log_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_workouts_on_goal_id", using: :btree
    t.index ["log_id"], name: "index_workouts_on_log_id", using: :btree
    t.index ["user_id"], name: "index_workouts_on_user_id", using: :btree
  end

  add_foreign_key "foods", "goals"
  add_foreign_key "foods", "logs"
  add_foreign_key "foods", "users"
  add_foreign_key "goals", "logs", column: "logs_id"
  add_foreign_key "goals", "users"
  add_foreign_key "logs", "goals"
  add_foreign_key "logs", "users"
  add_foreign_key "sleeps", "goals"
  add_foreign_key "sleeps", "logs"
  add_foreign_key "sleeps", "users"
  add_foreign_key "users", "logs", column: "logs_id"
  add_foreign_key "waters", "goals"
  add_foreign_key "waters", "logs"
  add_foreign_key "waters", "users"
  add_foreign_key "workouts", "goals"
  add_foreign_key "workouts", "logs"
  add_foreign_key "workouts", "users"
end
