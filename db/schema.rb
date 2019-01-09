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

ActiveRecord::Schema.define(version: 2019_01_09_134941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.integer "document_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "park_times", force: :cascade do |t|
    t.string "code", null: false
    t.boolean "processed", default: false
    t.float "cost_per_min"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_park_times_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "kind"
    t.string "identifier"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_vehicles_on_owner_id"
  end

  add_foreign_key "park_times", "vehicles", on_delete: :cascade
  add_foreign_key "vehicles", "owners", on_delete: :cascade
end
