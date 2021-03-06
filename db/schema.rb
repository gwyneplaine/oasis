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

ActiveRecord::Schema.define(version: 20150603072057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image"
  end

  create_table "categories_events", force: :cascade do |t|
    t.integer "category_id"
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.text     "name"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "description"
    t.integer  "location_id"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
  end

  create_table "events_locations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "location_id"
  end

  create_table "events_timelines", force: :cascade do |t|
    t.integer "event_id"
    t.integer "timeline_id"
  end

  create_table "events_users", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "timelines", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.integer  "location_id"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
