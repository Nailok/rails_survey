# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_21_170134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "title"
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "variant_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.integer "position", null: false
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "survey_id", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "survey_users", force: :cascade do |t|
    t.bigint "user_survey_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_survey_users_on_survey_id"
    t.index ["user_survey_id", "survey_id"], name: "index_survey_users_on_user_survey_id_and_survey_id", unique: true
    t.index ["user_survey_id"], name: "index_survey_users_on_user_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "public"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "tag_surveys", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id", "tag_id"], name: "index_tag_surveys_on_survey_id_and_tag_id", unique: true
    t.index ["survey_id"], name: "index_tag_surveys_on_survey_id"
    t.index ["tag_id"], name: "index_tag_surveys_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_surveys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_surveys_on_user_id"
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id", "tag_id"], name: "index_user_tags_on_user_id_and_tag_id", unique: true
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "type", null: false
    t.string "password_digest"
    t.date "birthday"
    t.string "phone"
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_variants_on_question_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "survey_users", "surveys"
  add_foreign_key "survey_users", "user_surveys"
  add_foreign_key "surveys", "users"
  add_foreign_key "tag_surveys", "surveys"
  add_foreign_key "tag_surveys", "tags"
  add_foreign_key "user_surveys", "users"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
  add_foreign_key "variants", "questions"
end
