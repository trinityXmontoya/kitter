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

ActiveRecord::Schema.define(version: 20140609110744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockees", force: true do |t|
    t.integer "user_id"
    t.integer "blocked_user_id"
  end

  create_table "favorites", id: false, force: true do |t|
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["tweet_id"], name: "index_favorites_on_tweet_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashtag_history", force: true do |t|
    t.integer "tweet_id"
    t.integer "hashtag_id"
  end

  create_table "hashtags", force: true do |t|
    t.integer  "num_of_times_used", default: 1
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", id: false, force: true do |t|
    t.string   "kind"
    t.integer  "user_id"
    t.integer  "poster_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",       default: false
  end

  create_table "replies", force: true do |t|
    t.integer  "original_tweet_id"
    t.integer  "reply_tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retweets", id: false, force: true do |t|
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "retweets", ["tweet_id"], name: "index_retweets_on_tweet_id", using: :btree
  add_index "retweets", ["user_id"], name: "index_retweets_on_user_id", using: :btree

  create_table "tweets", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_favs",         default: 0
    t.integer  "num_of_retweets",     default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "video_url"
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "background_photo_url",  default: "http://static2.grsites.com/archive/textures/ss/ss013.jpg"
    t.string   "profile_photo_url",     default: "http://img2.wikia.nocookie.net/__cb20130302002623/glee/images/5/50/20120814044316!Pusheen.png"
    t.string   "bio"
    t.string   "website"
    t.boolean  "verified",              default: false
    t.string   "location"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.datetime "auth_token_created_at"
    t.datetime "login_link_sent"
  end

end
