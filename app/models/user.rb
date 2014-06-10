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

  validates :username, :email, uniqueness: true
  validates :username, uniqueness: {case_insensitive: true}
  validates :username, length: {maximum: 15}
  validates :username, format: {with: /\w/, message: "Usernames may only contain numbers, letters, or underscores."}

  validates :email, correct_email_format: true

  # set user_id to username for more readable urls
  def to_param
    username
  end

  # LOGIN AUTH
  def send_login_link
    self.reset_auth_token
    link = "login/" + self.username + "/" + self.auth_token
    UserMailer.send_user_token(self,link).deliver
    self.update_attributes(login_link_sent: Time.now)
  end

  def reset_auth_token
    self.update_attributes(auth_token: self.generate_token)
    self.update_attributes(auth_token_created_at: Time.now)
    self.save
  end

  def validate_token(token)
    ((token == self.auth_token) && (self.token_is_not_expired)) ? true : false
  end

  def token_is_not_expired
    ((Time.now-self.login_link_sent) /1.hour) < 2
  end

  def generate_token
    token = SecureRandom.base64(23)
    User.where("auth_token = ?", token).exists? ? generate_token : token
  end

  # TWEET ACTIONS
  def follow(other_user)
    other_user.followers << self
    other_user.notifications.create!(tweet_id: 0, poster_id: id, kind: 'followed')
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
    tweet.update_num_of_retweets(1)
  end

  def undo_retweet(tweet)
    retweeted_tweets.delete(tweet)
    tweet.update_num_of_retweets(-1)
  end

  def followings
    Follow.where(follower_id: id)
  end

  def tweet_replies
    replies = []
    tweets.each do |tweet|
      replies << Reply.where(original_tweet_id: tweet.id )
    end
    return replies
  end

end
