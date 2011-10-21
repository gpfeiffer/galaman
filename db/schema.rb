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

ActiveRecord::Schema.define(:version => 20111016103714) do

  create_table "clubs", :force => true do |t|
    t.string   "full_name"
    t.string   "symbol"
    t.text     "contact"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "gender"
    t.integer  "distance"
    t.string   "course"
    t.string   "stroke"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.integer  "event_id"
    t.integer  "swimmer_id"
    t.integer  "seed_time"
    t.integer  "race_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "competition_id"
    t.integer  "discipline_id"
    t.integer  "pos"
    t.integer  "age_min"
    t.integer  "age_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualification_times", :force => true do |t|
    t.integer  "qualification_id"
    t.integer  "discipline_id"
    t.string   "gender"
    t.integer  "age_min"
    t.integer  "age_max"
    t.integer  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualifications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "competition_id"
    t.integer  "swimmer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swimmers", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "club_id"
    t.date     "birthday"
    t.string   "gender"
    t.string   "registration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end