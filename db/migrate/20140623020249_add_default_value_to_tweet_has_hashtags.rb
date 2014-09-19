class AddDefaultValueToTweetHasHashtags < ActiveRecord::Migration
  def change
    change_column :tweets, :has_hashtags, :boolean, default: :false, null: :false
  end
end
