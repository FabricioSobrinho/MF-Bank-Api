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

ActiveRecord::Schema[7.0].define(version: 2023_10_23_172939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "account_movements", primary_key: "true", id: { type: :string, limit: 10, default: -> { "substr((uuid_generate_v4())::text, 1, 10)" } }, force: :cascade do |t|
    t.float "montant", null: false
    t.string "sender"
    t.string "target"
    t.string "movement_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id", null: false
    t.index ["client_id"], name: "index_account_movements_on_client_id"
  end

  create_table "balances", primary_key: "true", id: { type: :string, limit: 10, default: -> { "substr((uuid_generate_v4())::text, 1, 6)" } }, force: :cascade do |t|
    t.float "user_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id", null: false
    t.index ["client_id"], name: "index_balances_on_client_id"
  end

  create_table "clients", id: { type: :string, limit: 10, default: -> { "substr((uuid_generate_v4())::text, 1, 10)" } }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "name", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "sur_name"
    t.string "email", default: "", null: false
    t.integer "acc_number"
    t.string "phone_number", default: "", null: false
    t.string "cpf", default: "", null: false
    t.string "cep", null: false
    t.string "uf"
    t.string "date_birth"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_clients_on_uid_and_provider", unique: true
  end

  add_foreign_key "account_movements", "clients"
  add_foreign_key "balances", "clients"
end
