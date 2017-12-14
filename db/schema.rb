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

ActiveRecord::Schema.define(version: 20171213003153) do

  create_table "grades", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year"], name: "index_grades_on_year", unique: true
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
