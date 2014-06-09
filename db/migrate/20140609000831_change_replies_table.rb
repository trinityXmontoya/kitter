class ChangeRepliesTable < ActiveRecord::Migration
  def change
      remove_column :replies, :user_id
      remove_column :replies, :tweet_id
      remove_column :replies, :content
      remove_column :replies, :created_at
      remove_column :replies, :updated_at
      add_column :replies, :original_tweet_id, :integer, references: :tweet
      add_column :replies, :reply_tweet_id, :integer, references: :tweet
end
end
