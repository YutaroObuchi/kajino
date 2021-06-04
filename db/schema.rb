# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_29_134727) do

  create_table "calculations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "time", null: false
    t.integer "housework_score"
    t.integer "sum"
    t.bigint "user_id", null: false
    t.bigint "housework_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["housework_id"], name: "index_calculations_on_housework_id"
    t.index ["user_id"], name: "index_calculations_on_user_id"
  end

  create_table "group_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "houseworks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "score", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_houseworks_on_group_id"
  end

  create_table "invites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email"
    t.integer "group_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "singleshots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "your_name", null: false
    t.string "partner_name", null: false
    t.integer "cook_point"
    t.integer "dish_washing_point"
    t.integer "laundry_point"
    t.integer "bath_washing_point"
    t.integer "vacuum_point"
    t.integer "your_cook"
    t.integer "your_dish_washing"
    t.integer "your_laundry"
    t.integer "your_bath_washing"
    t.integer "your_vacuum"
    t.integer "partner_cook"
    t.integer "partner_dish_washing"
    t.integer "partner_laundry"
    t.integer "partner_bath_washing"
    t.integer "partner_vacuum"
    t.integer "your_cook_sum"
    t.integer "your_dish_washing_sum"
    t.integer "your_laundry_sum"
    t.integer "your_bath_washing_sum"
    t.integer "your_vacuum_sum"
    t.integer "partner_cook_sum"
    t.integer "partner_dish_washing_sum"
    t.integer "partner_laundry_sum"
    t.integer "partner_bath_washing_sum"
    t.integer "partner_vacuum_sum"
    t.integer "your_sum"
    t.integer "partner_sum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "calculations", "houseworks"
  add_foreign_key "calculations", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "houseworks", "groups"
end
