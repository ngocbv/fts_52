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

ActiveRecord::Schema.define(version: 20160224033514) do

  create_table "admin_logs", force: :cascade do |t|
    t.string   "action"
    t.integer  "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "admin_logs", ["user_id_id"], name: "index_admin_logs_on_user_id_id"

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

  create_table "exams", force: :cascade do |t|
    t.integer  "status",     default: 0
    t.time     "spent_time"
    t.integer  "score"
    t.datetime "time_start"
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
  end

  add_index "exams", ["deleted_at"], name: "index_exams_on_deleted_at"
  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id"
  add_index "exams", ["user_id"], name: "index_exams_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_type", default: 0
    t.integer  "state",         default: 0
    t.integer  "subject_id"
    t.integer  "created_by"
    t.integer  "accepted_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
  end

  add_index "questions", ["deleted_at"], name: "index_questions_on_deleted_at"
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id"

  create_table "results", force: :cascade do |t|
    t.string   "answer_text"
    t.boolean  "correct"
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  add_index "results", ["answer_id"], name: "index_results_on_answer_id"
  add_index "results", ["deleted_at"], name: "index_results_on_deleted_at"
  add_index "results", ["exam_id"], name: "index_results_on_exam_id"
  add_index "results", ["question_id"], name: "index_results_on_question_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.time     "duration"
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
