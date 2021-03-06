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

ActiveRecord::Schema.define(version: 20171028085502) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id", "post_id", "created_at"], name: "index_comments_on_user_id_and_post_id_and_created_at"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "diff"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "point",      default: 0, null: false
  end

  create_table "pic_likes", force: :cascade do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pics", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "avatar"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    default: 1, null: false
  end

  create_table "post_likes", force: :cascade do |t|
    t.string   "key",        default: "key_should_be_specified", null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.text     "value"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "country"
    t.text     "address"
    t.string   "name"
    t.integer  "year"
    t.text     "link"
    t.string   "author"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "administrative_area_level_1"
    t.string   "locality"
    t.string   "ward"
    t.string   "sublocality_level_1"
    t.string   "sublocality_level_2"
    t.string   "sublocality_level_3"
    t.string   "sublocality_level_4"
    t.string   "sublocality_level_5"
    t.float    "latitude",                       null: false
    t.float    "longitude",                      null: false
    t.string   "country_ja"
    t.string   "address_ja"
    t.string   "administrative_area_level_1_ja"
    t.string   "locality_ja"
    t.string   "ward_ja"
    t.string   "sublocality_level_1_ja"
    t.string   "sublocality_level_2_ja"
    t.string   "sublocality_level_3_ja"
    t.string   "sublocality_level_4_ja"
    t.string   "sublocality_level_5_ja"
    t.string   "wikipedia_name"
    t.index ["latitude"], name: "index_posts_on_latitude"
    t.index ["longitude"], name: "index_posts_on_longitude"
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
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
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
    t.string   "nickname"
    t.integer  "first_login",            default: 1
    t.integer  "sum_point",              default: 0,     null: false
    t.boolean  "banned",                 default: false, null: false
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
