# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_201_203_143_151) do
  create_table 'accounts', force: :cascade do |t|
    t.string 'email'
    t.datetime 'confirmed_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'gender'
    t.integer 'rating', default: 1000
    t.string 'nickname'
    t.text 'bio'
    t.integer 'telephone'
    t.integer 'account_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_id'], name: 'index_profiles_on_account_id'
  end

  add_foreign_key 'profiles', 'accounts'
end
