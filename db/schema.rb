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

ActiveRecord::Schema.define(version: 20150307140657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "detail_id",                               null: false
    t.string   "detail_title"
    t.decimal  "detail_price",   precision: 10, scale: 2, null: false
    t.string   "discount_group",                          null: false
    t.float    "detail_weight",                           null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "real_price",     precision: 8,  scale: 3
    t.string   "zusatz"
    t.string   "ersatz"
  end

  add_index "details", ["brand_id"], name: "index_details_on_brand_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "detail_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["detail_id"], name: "index_line_items_on_detail_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "city"
    t.string   "delivery_service"
    t.string   "delivery_point_address"
    t.string   "family_name"
    t.string   "middle_name"
    t.string   "phone"
    t.string   "additional_info"
  end

  create_table "rabats", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "title"
    t.decimal  "value",      precision: 7, scale: 3
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "rabats", ["brand_id"], name: "index_rabats_on_brand_id", using: :btree
  add_index "rabats", ["title"], name: "index_rabats_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                                   default: "",  null: false
    t.decimal  "margin",                         precision: 5, scale: 2, default: 3.0
    t.string   "email",                                                  default: "",  null: false
    t.string   "encrypted_password",                                     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "family_name"
    t.string   "middle_name"
    t.string   "phone"
    t.string   "city"
    t.string   "default_delivery_service"
    t.string   "default_delivery_point_address"
    t.text     "default_additional_info"
    t.hstore   "brands_margins"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "line_items", "orders"
end
