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

ActiveRecord::Schema.define(version: 20140924001445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockees", force: true do |t|
    t.integer "user_id",         null: false
    t.integer "blocked_user_id", null: false
  end

  create_table "favorites", id: false, force: true do |t|
    t.integer  "tweet_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["tweet_id"], name: "index_favorites_on_tweet_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "follower_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashtag_history", force: true do |t|
    t.integer "tweet_id",   null: false
    t.integer "hashtag_id", null: false
  end

  create_table "hashtags", force: true do |t|
    t.integer  "num_of_times_used", default: 1, null: false
    t.string   "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", id: false, force: true do |t|
    t.string   "kind",                       null: false
    t.integer  "user_id",                    null: false
    t.integer  "poster_id",                  null: false
    t.integer  "tweet_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",       default: false, null: false
  end

  create_table "replies", force: true do |t|
    t.integer  "original_tweet_id", null: false
    t.integer  "reply_tweet_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retweets", id: false, force: true do |t|
    t.integer  "tweet_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "retweets", ["tweet_id"], name: "index_retweets_on_tweet_id", using: :btree
  add_index "retweets", ["user_id"], name: "index_retweets_on_user_id", using: :btree

  create_table "short_links", force: true do |t|
    t.string "orig_url",       null: false
    t.string "short_url_path", null: false
  end

  create_table "tweets", force: true do |t|
    t.text     "content",                             null: false
    t.integer  "user_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_favs",         default: 0,     null: false
    t.integer  "num_of_retweets",     default: 0,     null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "video_url"
    t.boolean  "has_hashtags",        default: false, null: false
    t.boolean  "has_mentions",        default: false, null: false
    t.boolean  "has_media",           default: false, null: false
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                                                                                                                       null: false
    t.string   "name",                                                                                                                           null: false
    t.string   "email",                                                                                                                          null: false
    t.string   "background_photo_url", default: "http://static2.grsites.com/archive/textures/ss/ss013.jpg",                                      null: false
    t.string   "profile_photo_url",    default: "http://img2.wikia.nocookie.net/__cb20130302002623/glee/images/5/50/20120814044316!Pusheen.png", null: false
    t.string   "bio"
    t.string   "website"
    t.string   "location"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.datetime "login_link_sent"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
