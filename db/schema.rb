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

ActiveRecord::Schema.define(version: 20170704124904) do

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

  create_table "efast_orders", force: :cascade do |t|
    t.string   "sell_record_code",  limit: 255
    t.string   "order_status",      limit: 255
    t.integer  "shipping_status",   limit: 4
    t.string   "pay_status",        limit: 255
    t.string   "sale_channel_code", limit: 255
    t.string   "shop_code",         limit: 255
    t.string   "buyer_name",        limit: 255
    t.string   "receiver_name",     limit: 255
    t.string   "receiver_country",  limit: 255
    t.string   "receiver_province", limit: 255
    t.string   "receiver_city",     limit: 255
    t.string   "receiver_district", limit: 255
    t.string   "receiver_street",   limit: 255
    t.string   "receiver_address",  limit: 255
    t.string   "receiver_addr",     limit: 255
    t.string   "receiver_zip_code", limit: 255
    t.string   "receiver_mobile",   limit: 255
    t.string   "receiver_phone",    limit: 255
    t.string   "receiver_email",    limit: 255
    t.integer  "payable_money",     limit: 4
    t.integer  "order_money",       limit: 4
    t.integer  "discount_fee",      limit: 4
    t.string   "pay_code",          limit: 255
    t.datetime "pay_time"
    t.string   "openid",            limit: 255
  end

  add_index "efast_orders", ["openid"], name: "index_efast_orders_on_openid", using: :btree
  add_index "efast_orders", ["receiver_mobile"], name: "index_efast_orders_on_receiver_mobile", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.string   "openid",             limit: 255
    t.integer  "dianyuan_id",        limit: 4
    t.string   "card_id",            limit: 255
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.integer  "sex",                limit: 4
    t.string   "phone",              limit: 255
    t.string   "birthday",           limit: 255
    t.string   "idcard",             limit: 255
    t.string   "email",              limit: 255
    t.string   "location",           limit: 255
    t.integer  "postcode",           limit: 4
    t.string   "education_backgro",  limit: 255
    t.string   "industry",           limit: 255
    t.string   "income",             limit: 255
    t.string   "habit",              limit: 255
    t.integer  "bonus",              limit: 4
    t.integer  "balance",            limit: 4
    t.integer  "level",              limit: 4
    t.string   "user_card_status",   limit: 255
    t.boolean  "has_active"
    t.integer  "total_consumption",  limit: 4
    t.integer  "recent_consumption", limit: 4
    t.datetime "update_points_date"
    t.integer  "total_num",          limit: 4
  end

  add_index "memberships", ["openid"], name: "index_memberships_on_openid", using: :btree

  create_table "offline_vip_orders", force: :cascade do |t|
    t.string   "vip_card",   limit: 255
    t.datetime "trade_date"
    t.string   "gkmc",       limit: 255
    t.integer  "sex",        limit: 4
    t.string   "get_money",  limit: 255
    t.string   "telephone",  limit: 255
    t.string   "vshop",      limit: 255
    t.string   "vempcode",   limit: 255
    t.string   "vspcode",    limit: 255
  end

  create_table "points_records", force: :cascade do |t|
    t.integer  "fans_id",      limit: 4
    t.string   "openid",       limit: 255
    t.string   "kdt_name",     limit: 255
    t.string   "mobile",       limit: 255
    t.integer  "amount",       limit: 4
    t.integer  "total",        limit: 4
    t.string   "description",  limit: 255
    t.datetime "created_time"
    t.string   "client_hash",  limit: 255
  end

  add_index "points_records", ["mobile"], name: "index_points_records_on_mobile", using: :btree
  add_index "points_records", ["openid"], name: "index_points_records_on_openid", using: :btree

  create_table "points_rules", force: :cascade do |t|
    t.integer  "level",       limit: 4
    t.integer  "consumption", limit: 4
    t.float    "rate",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",        limit: 255
    t.integer  "trade_num",   limit: 4
    t.integer  "condition",   limit: 4
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
  add_index "wx_users", ["openid"], name: "index_wx_users_on_openid", using: :btree

end
