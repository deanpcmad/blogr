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

ActiveRecord::Schema.define(version: 20131207215104) do

  create_table "blogr_categories", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "blogr_comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.string   "author_name"
    t.string   "author_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogr_comments", ["post_id"], name: "index_blogr_comments_on_post_id", using: :btree
  add_index "blogr_comments", ["user_id"], name: "index_blogr_comments_on_user_id", using: :btree

  create_table "blogr_images", force: true do |t|
    t.integer  "post_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogr_images", ["post_id"], name: "index_blogr_images_on_post_id", using: :btree

  create_table "blogr_posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "permalink"
    t.boolean  "published",    default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
  end

  add_index "blogr_posts", ["category_id"], name: "index_blogr_posts_on_category_id", using: :btree
  add_index "blogr_posts", ["user_id"], name: "index_blogr_posts_on_user_id", using: :btree

  create_table "blogr_taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogr_taggings", ["post_id"], name: "index_blogr_taggings_on_post_id", using: :btree
  add_index "blogr_taggings", ["tag_id"], name: "index_blogr_taggings_on_tag_id", using: :btree

  create_table "blogr_tags", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogr_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
