class Follow < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'

  validates_uniqueness_of :user_id, scope: :follower_id
end
