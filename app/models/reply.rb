class Reply < ActiveRecord::Base
  belongs_to :original_tweet, class_name: "Tweet", foreign_key: 'original_tweet_id'
  belongs_to :reply_tweet, class_name: "Tweet", foreign_key: 'reply_tweet_id'

  validates :original_tweet_id, :reply_tweet_id, presence: true

  # after_create :notify_original_tweeter

  def notify_original_tweeter
    original_tweet.user.notifications.create!(
      tweet: original_tweet,
      poster: reply_tweet.user,
      kind: 'replied'
      )
  end

end
