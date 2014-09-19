class AddDefaultValueToTweetHasMentions < ActiveRecord::Migration
  def change
        change_column :tweets, :has_mentions, :boolean, default: :false, null: :false
  end
end
