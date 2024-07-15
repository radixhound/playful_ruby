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

ActiveRecord::Schema[7.0].define(version: 2024_07_15_175114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_pieces", force: :cascade do |t|
    t.string "type"
    t.string "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version"
    t.bigint "player_id"
    t.string "representation"
    t.index ["player_id"], name: "index_game_pieces_on_player_id"
  end

  create_table "game_tiles", force: :cascade do |t|
    t.integer "row"
    t.integer "column"
    t.bigint "game_piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_board_id"
    t.string "background"
    t.integer "rotation", default: 0
    t.index ["game_board_id"], name: "index_game_tiles_on_game_board_id"
    t.index ["game_piece_id"], name: "index_game_tiles_on_game_piece_id"
  end

  create_table "login_credentials", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_login_credentials_on_email", unique: true
    t.index ["reset_password_token"], name: "index_login_credentials_on_reset_password_token", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "login_credential_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
    t.index ["login_credential_id"], name: "index_players_on_login_credential_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "value"
    t.string "label"
    t.string "name"
    t.bigint "game_board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_board_id"], name: "index_scores_on_game_board_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
  end

  add_foreign_key "players", "login_credentials"
  add_foreign_key "scores", "game_boards"
  add_foreign_key "scores", "players"
end
