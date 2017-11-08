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

ActiveRecord::Schema.define(version: 20171104020203) do

  create_table "grades", force: :cascade do |t|
    t.string   "grade_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "mark",       limit: 4
    t.integer  "student_id", limit: 4
    t.integer  "subject_id", limit: 4
    t.integer  "grade_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "f_name",          limit: 255
    t.string   "l_name",          limit: 255
    t.string   "nationality",     limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.string   "post_code",       limit: 255
    t.string   "gender",          limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.string   "dob",             limit: 255
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "subject_teachers", force: :cascade do |t|
    t.integer  "subject_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name", limit: 255
    t.string   "subject_code", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name",          limit: 255
    t.string   "l_name",          limit: 255
    t.string   "email",           limit: 255
    t.string   "dob",             limit: 255
    t.string   "password_digest", limit: 255
    t.string   "nationality",     limit: 255
    t.string   "national_id",     limit: 255
    t.string   "gender",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "role",            limit: 255
  end

end
