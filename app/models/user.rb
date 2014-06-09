class User < ActiveRecord::Base

  has_many :tweets, dependent: :destroy
  has_many :replies, dependent: :destroy

  has_many :retweets, dependent: :destroy
  has_many :retweeted_tweets, through: :retweets, class_name: "Tweet", source: :tweet

  has_many :favorites, dependent: :destroy
  has_many :favorited_tweets, through: :favorites, class_name: "Tweet", source: :tweet

  has_many :notifications, dependent: :destroy

  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, class_name: "User", source: :follower, foreign_key: 'follower_id'

  has_many :blockees, foreign_key: 'user_id', :class_name=>'Blockee'
  has_many :blocked_users, through: :blockees, dependent: :destroy


  validates :username, :name, :email, presence: true
  validates :background_photo_url, :profile_photo_url, presence: true

  validates :username, :name, :email, uniqueness: true
  validates :username, uniqueness: {case_insensitive: true}
  validates :username, length: {maximum: 15}
  validates :username, format: {with: /\w/, message: "Usernames may only contain numbers, letters, or underscores."}

  validates :email, correct_email_format: true

  def to_param
    username
  end

  def follow(other_user)
    other_user.followers << self
  end

  def unfollow(other_user)
    other_user.followers.delete(self)
  end

  def block(other_user)
      unfollow(other_user)
      blocked_users << other_user
      if followers.include? other_user
        followers.delete(other_user)
      end
  end

  def unblock(other_user)
     blocked_users.delete(other_user)
  end


  def favorite(tweet)
    favorited_tweets<<tweet
    tweet.user.notifications.create!(tweet:tweet,poster_id: id, kind: 'favorited')
    tweet.update_num_of_favs(1)
  end

  def unfavorite(tweet)
    favorited_tweets.delete(tweet)
    tweet.update_num_of_favs(-1)
  end

  def retweet(tweet)
    retweets.create!(tweet: tweet)
    tweet.user.notifications.create!(tweet:tweet,poster_id: id, kind: 'retweeted')
    tweet.update_num_of_retweets
  end

  def followees
    followees = []
    Follow.where(follower_id: id).each do |follow|
      followees << follow.user
    end
    return followees
  end

end
