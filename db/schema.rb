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

ActiveRecord::Schema.define(version: 20151101211813) do

  create_table "products", force: :cascade do |t|
    t.text     "brand"
    t.text     "color"
    t.text     "edition"
    t.text     "eisbn"
    t.text     "format"
    t.text     "isbn"
    t.text     "list_price"
    t.text     "model"
    t.text     "mpn"
    t.text     "part_number"
    t.text     "publication_date"
    t.text     "release_date"
    t.text     "publisher"
    t.text     "sku"
    t.text     "title"
    t.text     "upc"
    t.text     "size"
    t.integer  "wish_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "zipcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "threshold_price"
    t.string   "category"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
