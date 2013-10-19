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

ActiveRecord::Schema.define(version: 20131019135248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "simpleblog_categories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simpleblog_categories_posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simpleblog_categories_posts", ["category_id"], name: "index_simpleblog_categories_posts_on_category_id", using: :btree
  add_index "simpleblog_categories_posts", ["post_id"], name: "index_simpleblog_categories_posts_on_post_id", using: :btree

  create_table "simpleblog_images", force: true do |t|
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "simpleblog_images", ["post_id"], name: "index_simpleblog_images_on_post_id", using: :btree

  create_table "simpleblog_posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.datetime "published_at"
  end

end
