class CreateFollowersJoinTable < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user
      t.integer :follower_id

      t.timestamps
    end
  end
end
