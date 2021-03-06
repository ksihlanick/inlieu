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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130128192017) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "description"
    t.string   "inlieuof"
    t.string   "charity_name"
    t.decimal  "money_raised",        :precision => 8, :scale => 2
    t.decimal  "goal_money",          :precision => 8, :scale => 2
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.datetime "enddate"
    t.string   "video"
    t.boolean  "approved"
    t.boolean  "rejected"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "payments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "money_raised"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "event_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "confirmed"
    t.string   "confirm_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
