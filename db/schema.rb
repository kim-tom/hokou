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

ActiveRecord::Schema.define(version: 2019_04_17_014826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :string, force: :cascade do |t|
    t.string "username", limit: 40
    t.string "string", limit: 40
    t.string "salt", limit: 40
    t.string "hashed", limit: 40
    t.string "algo", limit: 5
  end

  create_table "hokous", force: :cascade do |t|
    t.integer "grade"
    t.string "dptmnt", limit: 4
    t.date "date_rest"
    t.string "koma_rest", limit: 40
    t.date "date_ex"
    t.string "koma_ex", limit: 40
    t.string "subject", limit: 40
    t.string "teacher", limit: 40
    t.string "bikou", limit: 140
  end

end
