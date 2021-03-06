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

ActiveRecord::Schema.define(version: 20150322134625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "amounts", force: :cascade do |t|
    t.integer  "brand_id",                                             null: false
    t.string   "detaill_code",                                         null: false
    t.integer  "quantity",                                             null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "fixed_price",                          default: false
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "category"
    t.string   "short_descr"
    t.text     "large_descr"
  end

  add_index "amounts", ["brand_id"], name: "index_amounts_on_brand_id", using: :btree
  add_index "amounts", ["detaill_code"], name: "index_amounts_on_detaill_code", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "detail_id",                                             null: false
    t.string   "detail_title"
    t.decimal  "detail_price",     precision: 10, scale: 2,             null: false
    t.string   "discount_group",                                        null: false
    t.float    "detail_weight",                                         null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.decimal  "real_price",       precision: 8,  scale: 3
    t.string   "zusatz"
    t.string   "ersatz"
    t.integer  "quantity_to_cart",                          default: 1
  end

  add_index "details", ["brand_id"], name: "index_details_on_brand_id", using: :btree

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id",     null: false
    t.string   "brand",        null: false
    t.string   "detail_code",  null: false
    t.string   "detail_title", null: false
    t.float    "real_price",   null: false
    t.integer  "detail_count", null: false
    t.float    "total_price",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "histories", ["detail_code"], name: "index_histories_on_detail_code", using: :btree
  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

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
    t.integer  "user_id"
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
    t.string   "name",                                                   default: "",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           null: false
    t.decimal  "margin",                         precision: 5, scale: 2, default: 3.0
    t.string   "email",                                                  default: "",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           null: false
    t.string   "encrypted_password",                                     default: "",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                          default: 0,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            null: false
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
    t.hstore   "brands_margins",                                         default: {"ZF"=>"3", "BMW"=>"3", "KIA"=>"3", "VAG"=>"3", "Fiat"=>"3", "Ford"=>"3", "Opel"=>"3", "Seat"=>"3", "Honda"=>"3", "Iveco"=>"3", "Mazda"=>"3", "Skoda"=>"3", "VOTEX"=>"3", "Volvo"=>"3", "Jaguar"=>"3", "Nissan"=>"3", "Subaru"=>"3", "Suzuki"=>"3", "Toyota"=>"3", "Citroen"=>"3", "Hyundai"=>"3", "Peugeot"=>"3", "Porsche"=>"3", "Renault"=>"3", "Bilstein"=>"3", "Chrysler"=>"3", "Infiniti"=>"3", "Chevrolet"=>"3", "Land Rover"=>"3", "Mitsubishi"=>"3", "Mercedes Benz"=>"3", "quantity_to_cart"=>"1"}
    t.boolean  "admin",                                                  default: false
    t.boolean  "activated",                                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "line_items", "orders"
end
