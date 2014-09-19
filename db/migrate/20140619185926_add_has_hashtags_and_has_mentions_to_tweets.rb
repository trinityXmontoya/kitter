class AddHasHashtagsAndHasMentionsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :has_hashtags, :boolean, null: :false
    add_column :tweets, :has_mentions, :boolean, null: :false
  end
end
