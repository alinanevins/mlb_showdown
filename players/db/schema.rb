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

ActiveRecord::Schema.define(version: 20160616212152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batters", force: :cascade do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "nameFull"
    t.integer  "yearID"
    t.string   "setID"
    t.integer  "cardNo"
    t.string   "team"
    t.integer  "onbaseSO"
    t.integer  "GB"
    t.integer  "FB"
    t.integer  "BB"
    t.integer  "_1B"
    t.integer  "_1Bplus"
    t.integer  "_2B"
    t.integer  "_3B"
    t.integer  "_HR"
    t.integer  "points"
    t.integer  "speed"
    t.string   "hand"
    t.string   "startingPos1"
    t.integer  "fielding1"
    t.string   "startingPos2"
    t.integer  "fielding2"
    t.string   "startingPos3"
    t.integer  "fielding3"
    t.string   "startingPos4"
    t.integer  "fielding4"
    t.integer  "TO"
    t.integer  "xbh"
    t.integer  "numPos"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "t1_batters", force: :cascade do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "nameFull"
    t.integer  "yearID"
    t.string   "setID"
    t.integer  "cardNo"
    t.string   "team"
    t.integer  "onbaseSO"
    t.integer  "GB"
    t.integer  "FB"
    t.integer  "BB"
    t.integer  "_1B"
    t.integer  "_1Bplus"
    t.integer  "_2B"
    t.integer  "_3B"
    t.integer  "_HR"
    t.integer  "points"
    t.integer  "speed"
    t.string   "hand"
    t.string   "startingPos1"
    t.integer  "fielding1"
    t.string   "startingPos2"
    t.integer  "fielding2"
    t.string   "startingPos3"
    t.integer  "fielding3"
    t.string   "startingPos4"
    t.integer  "fielding4"
    t.integer  "TO"
    t.integer  "xbh"
    t.integer  "numPos"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "t2_batters", force: :cascade do |t|
    t.string   "nameFirst"
    t.string   "nameLast"
    t.string   "nameFull"
    t.integer  "yearID"
    t.string   "setID"
    t.integer  "cardNo"
    t.string   "team"
    t.integer  "onbaseSO"
    t.integer  "GB"
    t.integer  "FB"
    t.integer  "BB"
    t.integer  "_1B"
    t.integer  "_1Bplus"
    t.integer  "_2B"
    t.integer  "_3B"
    t.integer  "_HR"
    t.integer  "points"
    t.integer  "speed"
    t.string   "hand"
    t.string   "startingPos1"
    t.integer  "fielding1"
    t.string   "startingPos2"
    t.integer  "fielding2"
    t.string   "startingPos3"
    t.integer  "fielding3"
    t.string   "startingPos4"
    t.integer  "fielding4"
    t.integer  "TO"
    t.integer  "xbh"
    t.integer  "numPos"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "t2_players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
