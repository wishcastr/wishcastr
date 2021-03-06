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

ActiveRecord::Schema.define(version: 20151111204639) do

  create_table "price_histories", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "currency"
    t.decimal  "price"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_price_histories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "type"
    t.string   "sku"
    t.string   "image_large"
    t.string   "image_thumbnail"
    t.string   "title"
    t.string   "brand"
    t.text     "description"
    t.string   "affiliate_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products_wishes", force: :cascade do |t|
    t.integer  "wish_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_wishes_on_product_id"
    t.index ["wish_id"], name: "index_products_wishes_on_wish_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "postal_code"
    t.string   "amz_id"
    t.string   "amz_access_token"
    t.string   "amz_raccess_token"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "provider"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "threshold_price"
    t.string   "category"
    t.string   "query"
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "saved",           default: false
    t.boolean  "notified",        default: false
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

end
