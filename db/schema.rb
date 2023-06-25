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

ActiveRecord::Schema[7.0].define(version: 2023_06_12_000547) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tictactoeboards", force: :cascade do |t|
    t.string "channel"
    t.boolean "player_1"
    t.boolean "player_2"
    t.string "cell_1"
    t.string "cell_2"
    t.string "cell_3"
    t.string "cell_4"
    t.string "cell_5"
    t.string "cell_6"
    t.string "cell_7"
    t.string "cell_8"
    t.string "cell_9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "circles_count", default: 0
    t.integer "crosses_count", default: 0
  end

end
