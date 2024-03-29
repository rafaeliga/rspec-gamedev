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

ActiveRecord::Schema.define(:version => 20120325031015) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "life",           :default => 0
    t.integer  "enemy_level_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "characters", ["enemy_level_id"], :name => "index_characters_on_enemy_level_id"

  create_table "game_saves", :force => true do |t|
    t.integer  "player_id"
    t.integer  "level_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "game_saves", ["level_id"], :name => "index_game_saves_on_level_id"
  add_index "game_saves", ["player_id"], :name => "index_game_saves_on_player_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "level_items", :force => true do |t|
    t.integer  "itemnable_id"
    t.string   "itemnable_type"
    t.integer  "level_id"
    t.integer  "item_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "level_items", ["item_id"], :name => "index_level_items_on_item_id"
  add_index "level_items", ["itemnable_id"], :name => "index_level_items_on_itemnable_id"
  add_index "level_items", ["level_id"], :name => "index_level_items_on_level_id"

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.time     "total_time"
    t.integer  "number_of_items_to_collect"
    t.integer  "farmer_id"
    t.integer  "recipient_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "game_save_id"
    t.integer  "current_level_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "players", ["current_level_id"], :name => "index_players_on_current_level_id"
  add_index "players", ["game_save_id"], :name => "index_players_on_game_save_id"

  create_table "recipients", :force => true do |t|
    t.integer  "farmer_id"
    t.integer  "level_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "recipients", ["level_id"], :name => "index_recipients_on_level_id"

end
