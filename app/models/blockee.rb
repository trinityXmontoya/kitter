class Blockee < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :blocked_user, foreign_key: 'blocked_user_id', class_name: 'User'

  validates_uniqueness_of :user_id, scope: :blocked_user_id
end
