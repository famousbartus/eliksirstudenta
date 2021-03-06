# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110423155108) do

  create_table "players", :force => true do |t|
    t.string   "first_name",                    :null => false
    t.string   "surename",                      :null => false
    t.string   "email",                         :null => false
    t.integer  "team_id",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.boolean  "verified",   :default => false
  end

  add_index "players", ["team_id"], :name => "index_players_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
