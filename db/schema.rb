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

ActiveRecord::Schema.define(version: 20140304230456) do

  create_table "competitions", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "css"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "live",       default: true
  end

  create_table "designs", force: true do |t|
    t.string   "image"
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_page_tabs", force: true do |t|
    t.integer  "competition_id",   null: false
    t.string   "facebook_page_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "mashtags", force: true do |t|
    t.string   "user_name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_page_id", default: "", null: false
  end

  add_index "mashtags", ["facebook_page_id", "user_name"], name: "index_mashtags_on_facebook_page_id_and_user_name", unique: true
  add_index "mashtags", ["slug"], name: "index_mashtags_on_slug", unique: true

end
