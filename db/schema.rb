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

ActiveRecord::Schema.define(version: 20140222200025) do

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

end
