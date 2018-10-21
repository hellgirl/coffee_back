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

ActiveRecord::Schema.define(version: 20181021144212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "drink_additions", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
  end

  create_table "drink_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name", null: false
    t.string "coffee_image"
    t.string "description"
    t.integer "drink_category_id"
  end

  create_table "drinks_volumes", force: :cascade do |t|
    t.bigint "drink_id"
    t.bigint "volume_id"
    t.float "price"
    t.index ["drink_id"], name: "index_drinks_volumes_on_drink_id"
    t.index ["volume_id"], name: "index_drinks_volumes_on_volume_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "drinks_volume_id"
    t.bigint "user_id"
    t.string "code", null: false
    t.string "status", null: false
    t.text "comment"
    t.float "total"
    t.index ["drinks_volume_id"], name: "index_orders_on_drinks_volume_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_additions", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "drink_addition_id"
    t.index ["drink_addition_id"], name: "index_orders_additions_on_drink_addition_id"
    t.index ["order_id"], name: "index_orders_additions_on_order_id"
  end

  create_table "payment_cards", force: :cascade do |t|
    t.json "card_meta"
    t.string "payment_method_id"
    t.string "title"
    t.bigint "user_id"
    t.boolean "default", null: false
    t.boolean "deleted"
    t.index ["user_id"], name: "index_payment_cards_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.json "yandex_meta"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "test_payment", default: false, null: false
  end

  create_table "staff_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notification_token"
    t.index ["email"], name: "index_staff_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staff_users_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "volumes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "volume", null: false
  end

  add_foreign_key "drinks", "drink_categories"
  add_foreign_key "drinks_volumes", "drinks"
  add_foreign_key "drinks_volumes", "volumes"
  add_foreign_key "orders", "drinks_volumes"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_additions", "drink_additions"
  add_foreign_key "orders_additions", "orders"
  add_foreign_key "payment_cards", "users"
  add_foreign_key "payments", "orders"
end
