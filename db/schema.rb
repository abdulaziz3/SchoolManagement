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

ActiveRecord::Schema.define(version: 20180316190639) do

  create_table "attendance_descriptions", force: :cascade do |t|
    t.string   "att_status", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name",    limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current_course",             default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.string   "homework_name", limit: 255
    t.text     "description",   limit: 65535
    t.integer  "marking",       limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "subject_id",    limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "lesson_name", limit: 255
    t.text     "lesson_note", limit: 65535
    t.string   "lesson_file", limit: 255
    t.integer  "subject_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                              default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "global",                             default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "is_delivered",                default: false
    t.string   "delivery_method", limit: 255
    t.string   "message_id",      limit: 255
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "mark",        limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "student_id",  limit: 4
    t.integer  "subject_id",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "homework_id", limit: 4
    t.string   "comment",     limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name",        limit: 255
    t.string   "role_description", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "student_attendances", force: :cascade do |t|
    t.integer  "student_id",                limit: 4
    t.integer  "attendance_description_id", limit: 4
    t.date     "date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "student_homeworks", force: :cascade do |t|
    t.integer  "student_id",  limit: 4
    t.integer  "homework_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "student_parents", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "student_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "student_subjects", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "subject_id", limit: 4
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
    t.integer  "grade_id",        limit: 4
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name", limit: 255
    t.string   "subject_code", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "grade_id",     limit: 4
    t.integer  "user_id",      limit: 4
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
    t.integer  "role_id",         limit: 4
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
