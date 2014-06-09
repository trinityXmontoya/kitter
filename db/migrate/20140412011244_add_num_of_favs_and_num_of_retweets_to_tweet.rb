class AddNumOfFavsAndNumOfRetweetsToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :num_of_favs, :integer, default: 0
    add_column :tweets, :num_of_retweets, :integer, default: 0
  end
end
