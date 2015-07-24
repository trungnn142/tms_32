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

ActiveRecord::Schema.define(version: 20150723041130) do

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "type"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id"
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id"
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "instruction"
    t.boolean  "is_active",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id"

  create_table "user_subjects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_subjects", ["subject_id"], name: "index_user_subjects_on_subject_id"
  add_index "user_subjects", ["user_id"], name: "index_user_subjects_on_user_id"

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "course_id"
    t.integer  "user_subject_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_tasks", ["course_id"], name: "index_user_tasks_on_course_id"
  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id"
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id"
  add_index "user_tasks", ["user_subject_id"], name: "index_user_tasks_on_user_subject_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.integer  "role"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
