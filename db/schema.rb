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

ActiveRecord::Schema.define(version: 20170211052048) do

  create_table "reservations", id: false, force: :cascade do |t|
    t.string   "rcrd_loc"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "a_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["rcrd_loc"], name: "index_reservations_on_rcrd_loc", unique: true

  create_table "segments", force: :cascade do |t|
    t.string   "origin"
    t.datetime "flt_time"
    t.datetime "checkin_time"
    t.string   "reservation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
