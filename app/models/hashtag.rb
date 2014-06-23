class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tweets, join_table: :hashtag_history

  validates :content, :num_of_times_used, presence: true
  validates :num_of_times_used, numericality: {equal_to: 1}, on: :create

  before_create :downcase

  def downcase
    content.downcase
  end

  def update_num_of_times_used(num)
    update(num_of_times_used: self.num_of_times_used +=(num))
  end

  def to_param
    content
  end

  #CACHING ----------------
  def self.cached_top_ten
    Rails.cache.fetch([name]) { order('num_of_times_used DESC').limit(10)}
  end

end
