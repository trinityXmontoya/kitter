class AddAvatarToTweet < ActiveRecord::Migration
  def change
    add_attachment :tweets, :avatar
  end
end
