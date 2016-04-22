# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160422172633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                                null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "checklists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "president_id"
    t.integer  "vice_president_id"
    t.integer  "party_list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "checklists_senators", id: false, force: :cascade do |t|
    t.integer "checklist_id"
    t.integer "senator_id"
  end

  add_index "checklists_senators", ["checklist_id"], name: "index_checklists_senators_on_checklist_id", using: :btree
  add_index "checklists_senators", ["senator_id"], name: "index_checklists_senators_on_senator_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "party_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.integer  "ballot_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "party_lists", ["ballot_number"], name: "index_party_lists_on_ballot_number", unique: true, using: :btree

  create_table "presidents", force: :cascade do |t|
    t.string   "name"
    t.integer  "party_id"
    t.string   "ballot_name"
    t.integer  "ballot_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "presidents", ["ballot_number"], name: "index_presidents_on_ballot_number", unique: true, using: :btree

  create_table "senators", force: :cascade do |t|
    t.string   "name"
    t.integer  "party_id"
    t.string   "ballot_name"
    t.integer  "ballot_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "senators", ["ballot_number"], name: "index_senators_on_ballot_number", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username",            default: ""
    t.string   "encrypted_password",  default: ""
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vice_presidents", force: :cascade do |t|
    t.string   "name"
    t.integer  "party_id"
    t.string   "ballot_name"
    t.integer  "ballot_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "vice_presidents", ["ballot_number"], name: "index_vice_presidents_on_ballot_number", unique: true, using: :btree

end
