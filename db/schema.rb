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

ActiveRecord::Schema.define(version: 20160829144625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confs", force: :cascade do |t|
    t.text     "keywords",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "local_legal_pages", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "translation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "local_news_items", force: :cascade do |t|
    t.text     "title"
    t.date     "date"
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image"
    t.integer  "translation_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.text     "title"
    t.date     "date"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "offices", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "x"
    t.string   "y"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "hq",          default: false, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "map_image"
    t.string   "map_url"
    t.string   "header"
    t.integer  "default_translation_id"
    t.text     "keywords"
  end

  create_table "translations", force: :cascade do |t|
    t.integer  "site_id",             null: false
    t.integer  "language_id",         null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "intro"
    t.text     "services"
    t.text     "products"
    t.text     "find_us"
    t.text     "lets_talk"
    t.text     "support"
    t.string   "intro_label"
    t.string   "services_label"
    t.string   "products_label"
    t.string   "news_label"
    t.string   "find_us_label"
    t.string   "lets_talk_label"
    t.string   "support_label"
    t.string   "contacts_label"
    t.string   "products_link_label"
    t.string   "services_link_label"
    t.string   "read_more"
  end

  add_index "translations", ["site_id", "language_id"], name: "index_translations_on_site_id_and_language_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.boolean  "admin"
    t.integer  "site_id"
    t.string   "password"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["site_id"], name: "index_users_on_site_id", using: :btree

  add_foreign_key "translations", "languages"
  add_foreign_key "translations", "sites"
  add_foreign_key "users", "sites"
end
