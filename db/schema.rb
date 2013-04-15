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

ActiveRecord::Schema.define(:version => 20130415032705) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "companies", ["remember_token"], :name => "index_companies_on_remember_token"

  create_table "industries", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "jobs", :force => true do |t|
    t.text    "description"
    t.integer "company_id"
    t.string  "position"
    t.integer "industry_id"
  end

  create_table "possessions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "user_invited_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "status"
    t.text     "description"
    t.integer  "smart"
    t.integer  "experiment"
    t.integer  "hardwork"
    t.integer  "teamwork"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "fbid"
    t.string   "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "coins"
    t.integer  "money"
  end

end
