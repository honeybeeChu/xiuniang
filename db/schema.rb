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

ActiveRecord::Schema.define(version: 20161107131354) do

  create_table "dianyuans", force: :cascade do |t|
    t.string   "DYDM",        limit: 255, null: false
    t.string   "DYMC",        limit: 255, null: false
    t.string   "DYXB",        limit: 255
    t.string   "QDDM",        limit: 255
    t.string   "KHDM",        limit: 255
    t.string   "XZDM",        limit: 255
    t.string   "ZDZK",        limit: 255
    t.string   "QMM",         limit: 255
    t.string   "BZ",          limit: 255
    t.string   "BYZD1",       limit: 255
    t.string   "BYZD2",       limit: 255
    t.string   "BYZD3",       limit: 255
    t.string   "BYZD4",       limit: 255
    t.string   "ZJF",         limit: 255
    t.string   "KWDM",        limit: 255
    t.string   "PHONE",       limit: 255
    t.string   "MOBILE",      limit: 255
    t.string   "EMAIL",       limit: 255
    t.datetime "BIRTHDAY"
    t.string   "EDUCATION",   limit: 255
    t.string   "ORIGIN",      limit: 255
    t.string   "IDENT_NO",    limit: 255
    t.datetime "IN_DATE"
    t.datetime "OUT_DATE"
    t.string   "ADDRESS",     limit: 255
    t.string   "OUT",         limit: 255
    t.datetime "GWDDRQ"
    t.string   "BYZD5",       limit: 255
    t.string   "BYZD6",       limit: 255
    t.string   "BYZD7",       limit: 255
    t.string   "BYZD8",       limit: 255
    t.string   "BYZD9",       limit: 255
    t.string   "QDBZ",        limit: 255
    t.datetime "LastChanged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_cards", primary_key: "card_id", force: :cascade do |t|
    t.string   "brand_name",  limit: 255
    t.string   "title",       limit: 255
    t.string   "sub_title",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "dianyuan_id",         limit: 4
    t.string   "member_card_card_id", limit: 255
    t.integer  "wx_user_id",          limit: 4
    t.string   "openid",              limit: 255
    t.boolean  "is_valid"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string   "sid",           limit: 255
    t.string   "business_name", limit: 255
    t.string   "branch_name",   limit: 255
    t.string   "province",      limit: 255
    t.string   "city",          limit: 255
    t.string   "district",      limit: 255
    t.string   "address",       limit: 255
    t.string   "telephone",     limit: 255
    t.string   "categories",    limit: 255
    t.string   "offset_type",   limit: 255
    t.string   "longitude",     limit: 255
    t.string   "latitude",      limit: 255
    t.string   "photo_list",    limit: 255
    t.string   "recommend",     limit: 255
    t.string   "special",       limit: 255
    t.string   "introduction",  limit: 255
    t.string   "open_time",     limit: 255
    t.string   "avg_price",     limit: 255
    t.string   "map_img",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "wx_users", force: :cascade do |t|
    t.string  "openid",         limit: 255
    t.string  "nickname",       limit: 255
    t.integer "sex",            limit: 4
    t.string  "language",       limit: 255
    t.string  "city",           limit: 255
    t.string  "province",       limit: 255
    t.string  "country",        limit: 255
    t.string  "headimgurl",     limit: 255
    t.string  "subscribe_time", limit: 255
    t.string  "unionid",        limit: 255
    t.string  "remark",         limit: 255
    t.integer "groupid",        limit: 4
    t.integer "subscribe",      limit: 4
    t.string  "phone",          limit: 255
    t.boolean "is_member"
  end

  add_index "wx_users", ["nickname"], name: "index_wx_users_on_nickname", using: :btree

end
