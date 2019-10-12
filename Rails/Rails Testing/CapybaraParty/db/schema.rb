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

ActiveRecord::Schema.define(version: 20160201054115) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "capy_id"
    t.string   "party_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["capy_id"], name: "index_attendances_on_capy_id"
  add_index "attendances", ["party_id", "capy_id"], name: "index_attendances_on_party_id_and_capy_id", unique: true

  create_table "capys", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.integer  "capy_id", null: false
    t.string   "occasion",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parties", ["capy_id"], name: "index_parties_on_capy_id"

end
