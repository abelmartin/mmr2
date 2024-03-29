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

ActiveRecord::Schema.define(version: 20140504190819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.integer  "user_id"
    t.string   "address",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gmap_url"
    t.string   "coordinates"
    t.boolean  "hq",          default: false, null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "routes", force: true do |t|
    t.integer  "start_location_id"
    t.integer  "end_location_id"
    t.string   "gmap_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",                                      default: 0, null: false
    t.decimal  "distance_in_miles",  precision: 2, scale: 0, default: 0, null: false
    t.integer  "distance_in_meters",                         default: 0, null: false
    t.datetime "trip_datetime",                                          null: false
    t.integer  "user_id",                                                null: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
