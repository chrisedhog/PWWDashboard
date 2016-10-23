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

ActiveRecord::Schema.define(version: 20161023110348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "client_name"
    t.string   "country"
    t.string   "company"
    t.decimal  "prior_year"
    t.decimal  "business_plan"
    t.decimal  "q1_forecast"
    t.decimal  "q2_forecast"
    t.decimal  "q3_forecast"
    t.decimal  "q4_forecast"
    t.boolean  "new_client"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location"
  end

  create_table "helps", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.string   "access_level"
    t.text     "body"
    t.string   "anchor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "country"
    t.string   "city"
    t.integer  "direct_number"
    t.string   "position"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "project_clients", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_clients", ["client_id"], name: "index_project_clients_on_client_id", using: :btree
  add_index "project_clients", ["project_id"], name: "index_project_clients_on_project_id", using: :btree

  create_table "project_locations", force: :cascade do |t|
    t.string   "location"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_status"
    t.string   "project_name"
    t.date     "completion_date"
    t.date     "completion_month"
    t.decimal  "budget_revenue"
    t.decimal  "budget_margin"
    t.integer  "client_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "search_all_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "search_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "search_all_projects", ["project_id"], name: "index_search_all_projects_on_project_id", using: :btree
  add_index "search_all_projects", ["search_id"], name: "index_search_all_projects_on_search_id", using: :btree

  create_table "search_clients", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "search_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "search_clients", ["client_id"], name: "index_search_clients_on_client_id", using: :btree
  add_index "search_clients", ["search_id"], name: "index_search_clients_on_search_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "project"
    t.string   "client"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_clients", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_clients", ["client_id"], name: "index_user_clients_on_client_id", using: :btree
  add_index "user_clients", ["user_id"], name: "index_user_clients_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 8,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "change_pass",            default: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "profiles", "users"
  add_foreign_key "project_clients", "clients"
  add_foreign_key "project_clients", "projects"
  add_foreign_key "projects", "clients"
  add_foreign_key "search_all_projects", "projects"
  add_foreign_key "search_all_projects", "searches"
  add_foreign_key "search_clients", "clients"
  add_foreign_key "search_clients", "searches"
  add_foreign_key "user_clients", "clients"
  add_foreign_key "user_clients", "users"
end
