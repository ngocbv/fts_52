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

ActiveRecord::Schema.define(version: 20160307161203) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "admin_logs", force: :cascade do |t|
    t.integer  "action"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "admin_logs", ["user_id"], name: "index_admin_logs_on_user_id"

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  add_index "answers", ["deleted_at"], name: "index_answers_on_deleted_at"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

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

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "exams", force: :cascade do |t|
    t.integer  "status",       default: 0
    t.integer  "spent_time",   default: 0
    t.integer  "score"
    t.datetime "time_start"
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "deleted_at"
    t.integer  "duration"
    t.integer  "question_num"
  end

  add_index "exams", ["deleted_at"], name: "index_exams_on_deleted_at"
  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id"
  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_type", default: 0
    t.integer  "state",         default: 0
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "accepted_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
  end

  add_index "questions", ["deleted_at"], name: "index_questions_on_deleted_at"
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"

  create_table "results", force: :cascade do |t|
    t.boolean  "correct"
    t.integer  "exam_id"
    t.integer  "question_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.string   "content_answer"
  end

  add_index "results", ["deleted_at"], name: "index_results_on_deleted_at"
  add_index "results", ["exam_id"], name: "index_results_on_exam_id"
  add_index "results", ["question_id"], name: "index_results_on_question_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.integer  "question_num"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
  end

  add_index "subjects", ["deleted_at"], name: "index_subjects_on_deleted_at"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "avatar"
    t.integer  "role",                   default: 0
    t.string   "chatwork_id"
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
