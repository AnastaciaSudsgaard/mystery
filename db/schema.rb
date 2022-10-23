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

ActiveRecord::Schema.define(version: 2022_10_23_025724) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "login_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_login_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_login_users_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_items", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "time_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_list_id"], name: "index_time_items_on_time_list_id"
  end

  create_table "time_lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "todo_contents", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "todo_list_id", null: false
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_todo_contents_on_room_id"
    t.index ["todo_list_id"], name: "index_todo_contents_on_todo_list_id"
    t.index ["user_id"], name: "index_todo_contents_on_user_id"
  end

  create_table "todo_ins", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "todo_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_list_id"], name: "index_todo_ins_on_todo_list_id"
  end

  create_table "todo_insides", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "todo_list_id", null: false
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_todo_insides_on_book_id"
    t.index ["todo_list_id"], name: "index_todo_insides_on_todo_list_id"
    t.index ["user_id"], name: "index_todo_insides_on_user_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.text "description"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "todo_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["todo_list_id"], name: "index_todo_items_on_todo_list_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_todo_lists_on_book_id"
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "time_items", "time_lists"
  add_foreign_key "todo_contents", "rooms"
  add_foreign_key "todo_contents", "todo_lists"
  add_foreign_key "todo_contents", "users"
  add_foreign_key "todo_ins", "todo_lists"
  add_foreign_key "todo_insides", "books"
  add_foreign_key "todo_insides", "todo_lists"
  add_foreign_key "todo_insides", "users"
  add_foreign_key "todo_items", "todo_lists"
  add_foreign_key "todo_lists", "books"
  add_foreign_key "todo_lists", "users"
end
