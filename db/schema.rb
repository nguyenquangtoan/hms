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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111014025941) do

  create_table "bill_details", :force => true do |t|
    t.integer  "bill_id",                             :null => false
    t.string   "destination",                         :null => false
    t.datetime "call_time",                           :null => false
    t.integer  "duration",           :default => 0,   :null => false
    t.integer  "begin_second_block"
    t.decimal  "begin_block_rate"
    t.decimal  "minute_rate"
    t.decimal  "fixed_rate"
    t.decimal  "amount",             :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
  end

  create_table "bills", :force => true do |t|
    t.integer  "guest_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.string   "name",                                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "personal_id_number", :default => "empty", :null => false
  end

  create_table "occupancies", :force => true do |t|
    t.integer  "guest_id",   :null => false
    t.integer  "room_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "move"
  end

  create_table "rate_cards", :force => true do |t|
    t.string   "tariff_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "rate_plans", :force => true do |t|
    t.integer  "room_type_id", :null => false
    t.integer  "rate_card_id", :null => false
    t.datetime "start_date",   :null => false
    t.datetime "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rate_card_id",       :null => false
    t.string   "description"
    t.string   "prefix",             :null => false
    t.integer  "begin_second_block"
    t.decimal  "begin_block_rate"
    t.decimal  "minute_rate"
    t.decimal  "fixed_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "room_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "number",       :null => false
    t.string   "extension",    :null => false
    t.integer  "room_type_id", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
