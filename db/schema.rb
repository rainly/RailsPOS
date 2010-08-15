# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100814175903) do

  create_table "bottles", :force => true do |t|
    t.string   "display_name"
    t.string   "full_name"
    t.string   "brewery"
    t.string   "country"
    t.float    "abv"
    t.string   "source"
    t.float    "volume"
    t.string   "volume_unit"
    t.integer  "cost"
    t.string   "glass_type"
    t.float    "sales_tax"
    t.float    "excise_tax"
    t.integer  "price"
    t.integer  "stock"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "draughts", :force => true do |t|
    t.string   "display_name"
    t.string   "full_name"
    t.string   "brewery"
    t.string   "country"
    t.float    "abv"
    t.string   "source"
    t.float    "volume"
    t.string   "volume_unit"
    t.integer  "keg_cost"
    t.integer  "serving_size"
    t.string   "glass_type"
    t.float    "sales_tax"
    t.float    "excise_tax"
    t.integer  "price"
    t.integer  "stock"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drawers", :force => true do |t|
    t.integer  "user_id"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", :force => true do |t|
    t.string   "display_name"
    t.integer  "cost"
    t.float    "sales_tax"
    t.integer  "price"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "miscs", :force => true do |t|
    t.string   "display_name"
    t.integer  "cost"
    t.float    "sales_tax"
    t.integer  "price"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tab_id"
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tabs", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "drawer_id"
    t.datetime "closed_at"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.string   "type"
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "role"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "changes"
    t.integer  "number"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end
