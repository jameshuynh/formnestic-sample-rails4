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

ActiveRecord::Schema.define(version: 20140623104410) do

  create_table "quiz_pool_answer_set_answer_quiz_pool_question_options", force: true do |t|
    t.integer  "quiz_pool_answer_set_answer_id"
    t.integer  "quiz_pool_question_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_pool_answer_set_answer_quiz_pool_question_options", ["quiz_pool_answer_set_answer_id", "quiz_pool_question_option_id"], name: "[\"option_answer_index\"]"

  create_table "quiz_pool_answer_set_answers", force: true do |t|
    t.integer  "quiz_pool_answer_set_id"
    t.integer  "quiz_pool_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_pool_answer_sets", force: true do |t|
    t.integer  "quiz_pool_id"
    t.string   "quiz_taker_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",              default: 0
    t.float    "correct_percentage", default: 0.0
  end

  create_table "quiz_pool_question_options", force: true do |t|
    t.text     "description"
    t.boolean  "is_correct"
    t.integer  "quiz_pool_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_pool_questions", force: true do |t|
    t.text     "description"
    t.integer  "score",        limit: 255
    t.integer  "quiz_pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_pools", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_score",          default: 0
    t.float    "correct_percentage", default: 0.0
  end

end
