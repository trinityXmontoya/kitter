class AddTimestampsToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :created_at, :datetime
    add_column :replies, :updated_at, :datetime
  end
end
