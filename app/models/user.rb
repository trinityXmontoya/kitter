 class User < ActiveRecord::Base

include Rails.application.routes.url_helpers

  has_many :tweets, dependent: :destroy

  has_many :replies, through: :tweets, class_name: "Tweet", source: :tweet, foreign_key: 'reply_tweet_id'

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

  after_commit :flush_cache

  # set user_id to username for more readable urls
  def to_param
    username
  end

  # TODO UPGRADE TO 'VALID UNTIL'
  # LOGIN AUTH ----------------
  def send_login_link
    reset_auth_token
    link = root_path + "login/" + self.username + "/" + self.auth_token
    Pony.mail(to: self.email, subject: "Login", body: login_msg_body(link) )
    update_attribute(:login_link_sent, Time.now)
  end

  def reset_auth_token
    update_attribute(:auth_token, generate_token)
  end

  def generate_token
    token = SecureRandom.urlsafe_base64(23)
    User.exists?(auth_token: token) ? generate_token : token
  end

  def login_msg_body(login_link)
    "Hey #{self.username.capitalize}, here's your login link: #{login_link}.
  Requested on #{self.login_link_sent}. If not used it will expire in 2 minutes for safety reasons. Read more about our login-process #{root_path}"
  end


  def validate_token(token)
    ((token == self.auth_token) && (self.token_is_not_expired)) ? true : false
  end

  def token_is_not_expired
    ((Time.now-self.login_link_sent) /1.hour) < 2
  end


  # TWEET ACTIONS ----------------
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
    followings = []
    Follow.where(follower_id: id).includes(:user).each do |follow|
      followings << follow.user
    end
    return followings
  end

  def tweet_replies
    replies = []
    tweets.includes(:replies).each do |tweet|
      replies << tweet.replies
    end
    return replies
  end

  # def potential_followees(given_user,num)
  #    User.all.reject {|user| user.followings.include?(given_user)}.sample(num)
  # end

  #CACHING ----------------
  def self.cached_find(username)
    Rails.cache.fetch([name,username]) {find_by_username(username)}
  end

  def flush_cache
    puts "cache flushing"
    puts "woot"
    Rails.cache.delete([self.class.name, username])
  end

  def cached_tweets_size
    Rails.cache.fetch([self, "tweets_size"]) {tweets.size}
  end

  def cached_followings_size
    Rails.cache.fetch([self, "followers_size"]) {followers.size}
  end

  def cached_followers_size
    Rails.cache.fetch([self, "followings_size"]) {followings.size}
  end

end
