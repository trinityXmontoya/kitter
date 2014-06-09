class AddVideoUrlToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :video_url, :string
  end
end
