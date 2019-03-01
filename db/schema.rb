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

ActiveRecord::Schema.define(version: 20190301153400) do

  create_table "charity_projects", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "imageUrl"
    t.integer "donation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["donation_id"], name: "index_charity_projects_on_donation_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "amount"
    t.integer "gift_id"
    t.integer "donor_id"
    t.integer "charity_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charity_project_id"], name: "index_donations_on_charity_project_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["gift_id"], name: "index_donations_on_gift_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "email"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.boolean "sent"
    t.boolean "seen"
    t.integer "video_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_gifts_on_receiver_id"
    t.index ["video_id"], name: "index_gifts_on_video_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "address"
    t.string "country"
    t.string "province"
    t.integer "postcode"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
