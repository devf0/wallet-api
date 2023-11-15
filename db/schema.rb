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

ActiveRecord::Schema.define(version: 2023_11_15_160447) do

  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.string "account_type"
    t.string "username"
    t.string "password_digest"
    t.decimal "balance", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", charset: "utf8mb4", force: :cascade do |t|
    t.string "source_wallet_type"
    t.bigint "source_wallet_id"
    t.string "target_wallet_type"
    t.bigint "target_wallet_id"
    t.decimal "amount", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_wallet_type", "source_wallet_id"], name: "index_transactions_on_source_wallet"
    t.index ["target_wallet_type", "target_wallet_id"], name: "index_transactions_on_target_wallet"
  end

end
