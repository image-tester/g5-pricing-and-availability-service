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

ActiveRecord::Schema.define(version: 20131219230851) do

  create_table "floor_plans", force: true do |t|
    t.string   "title"
    t.integer  "available_now"
    t.integer  "available_soon"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "size"
    t.integer  "price"
    t.integer  "deposit"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.string   "price_url"
    t.integer  "row_order"
  end

  create_table "locations", force: true do |t|
    t.string   "urn"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
