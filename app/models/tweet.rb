require 'embedly'

class Tweet < ActiveRecord::Base
  belongs_to :user, touch: true
  has_many :replies, foreign_key: 'original_tweet_id', dependent: :destroy
  has_many :retweets, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_and_belongs_to_many :hashtags, join_table: :hashtag_history

  validates :content, :user_id, :num_of_favs, :num_of_retweets, presence: true

  before_create :scan_tweet
  before_destroy :update_hashtag_count

  def update_hashtag_count
    if contains_hashtag
      find_and_delete_hashtags
    end
  end

  def contains_hashtag
    content.include? "(/#([a-zA-Z]|\d)+/)"
  end

  def find_and_delete_hashtags
    content.split.each do |word|
        if word.include? "#"
          Hashtag.find(word).update_num_of_times_used(-1)
        end
      end
  end

  def scan_tweet
    find_links(content) && find_hashtags(content) && find_mentions(content)
  end

  def find_links(string)
    string.split.each_with_index do |word,i|
      if uri?(word)
        string << embed_media(word)
        short_url = shorten_url(word)
        string.sub!(word, "<a href='#{short_url}'>#{short_url}</a>")
      end
    end
    return string
  end

  def uri?(string)
    parser=URI::Parser.new
    uri = parser.parse(string)
    %w( http https www. ).include?(uri.scheme)
    rescue URI::BadURIError
    false
    rescue URI::InvalidURIError
    false
  end

  def embed_media(url)
    embedly_api = Embedly::API.new :key => '1417d995b5a74c61b647102980df6107'
    obj = (embedly_api.oembed :url => url)[0]
    puts obj
    if obj[:type]=='video'
      obj[:html] if obj[:type]=='video'
    elsif obj[:type]=='photo'
      "<img class='tweet-display-photo' src='#{shorten_url(url)}'>"
    else
      if obj[:title]
        url=obj[:title]
      end
      "<a href='url'>#{url}</a>"
    end
  end

  def shorten_url(url)
    new_link = ShortLink.find_or_create_by(orig_url: url)
    return 'http://localhost:3000' + '/s/' + new_link.short_url_path
  end

  def generate_short_url
    path = SecureRandom.urlsafe_base64(6)
  end

  def find_hashtags(string)
    string.split.each do |word|
      if word.match(/#([a-zA-Z]|\d)+/)
        orig_word=word
        word=word.delete("#")
        hashtag=Hashtag.find_by(content: word.downcase)
        hashtag ? hashtag.update_num_of_times_used(1) : Hashtag.create(content: word)
        string.sub!(orig_word,"<a href='/hashtags/#{word}'>#{orig_word}</a>")
     end
   end
     return string
  end

    def find_mentions(string)
    string.split.each do |word|
      if word.match(/@\w{1,}/)
        user=User.cached_find((word.delete("@")))
        if user
        string.sub!(word,"<a href='/users/#{user.username}'>#{word}</a>")
        end
      end
    end
    return string
  end

  def update_num_of_favs(num)
    update(num_of_favs: self.num_of_favs+=num)
  end

  def update_num_of_retweets(num)
    update(num_of_retweets: self.num_of_retweets+=num)
  end

  def self.find_with_hashtag(hashtag)
    Tweet.where('content ILIKE ?', "%##{hashtag}%")
  end

  def is_a_reply
    Reply.where(reply_tweet_id: id).exists?
  end

  def original_tweet_replied_to
    Reply.where(reply_tweet_id: id).first.original_tweet
  end

  #CACHING ----------------
  def a
  end

end
