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

ActiveRecord::Schema.define(version: 2019_11_29_151531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefits", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "value_in_points"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_benefits_on_event_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color_hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_event_categories_on_category_id"
    t.index ["event_id"], name: "index_event_categories_on_event_id"
  end

  create_table "event_fb_event_admins", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "fb_event_admin_id"
    t.index ["event_id"], name: "index_event_fb_event_admins_on_event_id"
    t.index ["fb_event_admin_id"], name: "index_event_fb_event_admins_on_fb_event_admin_id"
  end

  create_table "events", force: :cascade do |t|
    t.boolean "featured", default: false
    t.string "title"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
    t.datetime "start_time"
    t.string "cover"
    t.string "fb_event_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "fb_event_admins", force: :cascade do |t|
    t.string "name"
    t.string "fb_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string "status"
    t.string "guest_name"
    t.string "guest_email"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.float "latitude"
    t.integer "capacity"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "front_picture"
    t.float "longitude"
    t.index ["event_id"], name: "index_places_on_event_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_trades_on_benefit_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "name"
    t.integer "points"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefits", "events"
  add_foreign_key "event_categories", "categories"
  add_foreign_key "event_categories", "events"
  add_foreign_key "event_fb_event_admins", "events"
  add_foreign_key "event_fb_event_admins", "fb_event_admins"
  add_foreign_key "events", "users"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "places", "events"
  add_foreign_key "trades", "benefits"
  add_foreign_key "trades", "users"
end
