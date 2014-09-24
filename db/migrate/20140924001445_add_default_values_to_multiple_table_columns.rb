class AddDefaultValuesToMultipleTableColumns < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, :null => false
    change_column :users, :name, :string, :null => false
    change_column :users, :email, :string, :null => false
    change_column :users, :background_photo_url, :string, :null => false
    change_column :users, :profile_photo_url, :string, :null => false

    change_column :tweets, :content, :text, :null => false
    change_column :tweets, :user_id, :integer, :null => false
    change_column :tweets, :num_of_favs, :integer, :null => false
    change_column :tweets, :num_of_retweets, :integer, :null => false
    change_column :tweets, :has_hashtags, :boolean, :null => false
    change_column :tweets, :has_mentions, :boolean, :null => false
    change_column :tweets, :has_media, :boolean, :default => false
    change_column :tweets, :has_media, :boolean, :null => false

    change_column :short_links, :orig_url, :string, :null => false
    change_column :short_links, :short_url_path, :string, :null => false

    change_column :retweets, :user_id, :integer, :null => false
    change_column :retweets, :tweet_id, :integer, :null => false

    change_column :replies, :original_tweet_id, :integer, :null => false
    change_column :replies, :reply_tweet_id, :integer,:null => false

    change_column :notifications, :kind, :string, :null => false
    change_column :notifications, :user_id, :integer, :null => false
    change_column :notifications, :tweet_id, :integer, :null => false
    change_column :notifications, :poster_id, :integer, :null => false
    change_column :notifications, :read, :boolean, :null => false

    change_column :hashtags, :content, :string, :null => false
    change_column :hashtags, :num_of_times_used, :integer, :null => false

    change_column :hashtag_history, :hashtag_id, :integer, :null => false
    change_column :hashtag_history, :tweet_id, :integer, :null => false

    change_column :follows, :user_id, :integer, :null => false
    change_column :follows, :follower_id, :integer, :null => false

    change_column :favorites, :user_id, :integer, :null => false
    change_column :favorites, :tweet_id, :integer, :null => false

    change_column :blockees, :user_id, :integer, :null => false
    change_column :blockees, :blocked_user_id, :integer, :null => false
  end
end
