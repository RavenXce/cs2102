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

ActiveRecord::Schema.define(version: 20131106201637) do

  create_table "airports", force: true do |t|
    t.string   "iata_code"
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
  end

  create_table "bookings", force: true do |t|
    t.integer  "reference_id"
    t.string   "destination"
    t.string   "origin"
    t.boolean  "is_two_way"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "price",        precision: 6, scale: 2
  end

  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "flights", force: true do |t|
    t.string   "flight_number"
    t.string   "airline"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.string   "departure_location"
    t.string   "arrival_location"
    t.string   "departure_gate"
    t.string   "arrival_gate"
    t.string   "departure_terminal"
    t.string   "arrival_terminal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",              precision: 6, scale: 2
    t.integer  "capacity"
  end

  create_table "passengers", force: true do |t|
    t.string   "passport_no"
    t.string   "nationality"
    t.string   "address"
    t.string   "country"
    t.string   "name"
    t.datetime "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "booking_id"
    t.string   "seat_number"
    t.integer  "flight_id"
    t.string   "passenger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
