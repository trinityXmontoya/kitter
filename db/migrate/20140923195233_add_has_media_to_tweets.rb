class AddHasMediaToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :has_media, :boolean
  end
end
