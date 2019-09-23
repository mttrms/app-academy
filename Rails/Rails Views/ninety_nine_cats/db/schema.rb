# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_23_034815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "status", default: "PENDING", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cat_id"], name: "index_cat_rental_requests_on_cat_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name", null: false
    t.date "birth_date", null: false
    t.string "sex", limit: 1, null: false
    t.string "color", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cat_rental_requests", "cats"
end
