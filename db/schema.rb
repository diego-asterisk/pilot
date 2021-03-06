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

ActiveRecord::Schema.define(version: 20171220233555) do

  create_table "exam_instances", force: :cascade do |t|
    t.string "title"
    t.datetime "exam_date"
    t.decimal "min_score", precision: 4, scale: 2
    t.integer "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_exam_instances_on_grade_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year"], name: "index_grades_on_year", unique: true
  end

  create_table "professors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_professors_on_email", unique: true
  end

  create_table "results", force: :cascade do |t|
    t.decimal "score", precision: 4, scale: 2
    t.integer "student_id"
    t.integer "exam_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_instance_id"], name: "index_results_on_exam_instance_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email"
    t.string "last_name"
    t.string "first_name"
    t.string "document_number"
    t.integer "docket_number"
    t.integer "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["docket_number", "grade_id"], name: "index_students_on_docket_number_and_grade_id", unique: true
    t.index ["grade_id"], name: "index_students_on_grade_id"
  end

end
