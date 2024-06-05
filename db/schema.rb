# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_05_175143) do
  create_table "friend_set_teams", force: :cascade do |t|
    t.integer "friend_set_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_set_id"], name: "index_friend_set_teams_on_friend_set_id"
    t.index ["team_id"], name: "index_friend_set_teams_on_team_id"
  end

  create_table "friend_sets", force: :cascade do |t|
    t.integer "team_id", null: false
    t.string "name"
    t.float "multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "friend_id", null: false
    t.index ["friend_id"], name: "index_friend_sets_on_friend_id"
    t.index ["team_id"], name: "index_friend_sets_on_team_id"
  end

  create_table "friend_teams", force: :cascade do |t|
    t.integer "friend_id", null: false
    t.integer "team_id", null: false
    t.integer "points", default: 0
    t.float "multiplier", default: 1.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_teams_on_friend_id"
    t.index ["team_id"], name: "index_friend_teams_on_team_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "team1_id", null: false
    t.integer "team2_id", null: false
    t.integer "team1_score"
    t.integer "team2_score"
    t.datetime "game_date"
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team1_id"], name: "index_games_on_team1_id"
    t.index ["team2_id"], name: "index_games_on_team2_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "start_time", precision: nil
    t.string "status"
    t.string "stage"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accessible_event_summary"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "set_teams", force: :cascade do |t|
    t.integer "set_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["set_id"], name: "index_set_teams_on_set_id"
    t.index ["team_id"], name: "index_set_teams_on_team_id"
  end

  create_table "team_set_teams", force: :cascade do |t|
    t.integer "team_set_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_set_teams_on_team_id"
    t.index ["team_set_id"], name: "index_team_set_teams_on_team_set_id"
  end

  create_table "team_sets", force: :cascade do |t|
    t.string "name"
    t.decimal "multiplier"
    t.integer "friend_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_team_sets_on_friend_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "urn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points", default: 0
  end

  add_foreign_key "friend_set_teams", "friend_sets"
  add_foreign_key "friend_set_teams", "teams"
  add_foreign_key "friend_sets", "friends"
  add_foreign_key "friend_sets", "teams"
  add_foreign_key "friend_teams", "friends"
  add_foreign_key "friend_teams", "teams"
  add_foreign_key "games", "teams", column: "team1_id"
  add_foreign_key "games", "teams", column: "team2_id"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "set_teams", "sets"
  add_foreign_key "set_teams", "teams"
  add_foreign_key "team_set_teams", "team_sets"
  add_foreign_key "team_set_teams", "teams"
  add_foreign_key "team_sets", "friends"
end
