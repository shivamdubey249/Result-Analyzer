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

ActiveRecord::Schema[8.0].define(version: 2026_05_07_102135) do
  create_table "daily_result_statistics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.string "subject"
    t.integer "daily_low"
    t.integer "daily_high"
    t.integer "result_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "subject"], name: "index_daily_result_statistics_on_date_and_subject", unique: true
  end

  create_table "monthly_result_averages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "month"
    t.string "subject"
    t.float "average_daily_high"
    t.float "average_daily_low"
    t.integer "total_result_count"
    t.integer "days_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month", "subject"], name: "index_monthly_result_averages_on_month_and_subject", unique: true
  end

  create_table "test_results", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "student_name"
    t.string "subject"
    t.integer "marks"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
