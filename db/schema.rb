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

ActiveRecord::Schema.define(version: 20180605164650) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
  end

  add_index "articles", ["team_id"], name: "index_articles_on_team_id"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "discussion_id"
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "discussion_downvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_downvotes", ["discussion_id"], name: "index_discussion_downvotes_on_discussion_id"
  add_index "discussion_downvotes", ["user_id"], name: "index_discussion_downvotes_on_user_id"

  create_table "discussion_stars", force: :cascade do |t|
    t.integer  "discussion_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_stars", ["discussion_id"], name: "index_discussion_stars_on_discussion_id"
  add_index "discussion_stars", ["user_id"], name: "index_discussion_stars_on_user_id"

  create_table "discussion_upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "discussion_upvotes", ["discussion_id"], name: "index_discussion_upvotes_on_discussion_id"
  add_index "discussion_upvotes", ["user_id"], name: "index_discussion_upvotes_on_user_id"

  create_table "discussions", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "playbook_stars", force: :cascade do |t|
    t.integer  "playbook_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playbook_stars", ["playbook_id"], name: "index_playbook_stars_on_playbook_id"
  add_index "playbook_stars", ["user_id"], name: "index_playbook_stars_on_user_id"

  create_table "playbooks", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image"
  end

  add_index "playbooks", ["user_id"], name: "index_playbooks_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.date     "born_on"
    t.string   "born_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "team_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["team_id"], name: "index_users_on_team_id"

end
