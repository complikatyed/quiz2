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

ActiveRecord::Schema.define(version: 20150623233300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_games", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_games", ["game_id"], name: "index_player_games_on_game_id", using: :btree
  add_index "player_games", ["player_id"], name: "index_player_games_on_player_id", using: :btree

  create_table "player_team_games", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_game_id"
    t.integer  "points"
    t.integer  "negs"
    t.boolean  "captain"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "player_team_games", ["player_id"], name: "index_player_team_games_on_player_id", using: :btree
  add_index "player_team_games", ["team_game_id"], name: "index_player_team_games_on_team_game_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "cell"
    t.integer  "points",     default: 0
    t.integer  "negs",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "team_games", force: :cascade do |t|
    t.integer  "team_score"
    t.integer  "opponent_score"
    t.boolean  "win"
    t.datetime "date_played"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "player_games", "games"
  add_foreign_key "player_games", "players"
  add_foreign_key "player_team_games", "players"
  add_foreign_key "player_team_games", "team_games"
end
