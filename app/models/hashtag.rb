class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tweets, join_table: :hashtag_history

  validates :content, :num_of_times_used, presence: true
  validates :num_of_times_used, numericality: {equal_to: 1}, on: :create

  before_create :downcase

  def downcase
    content.downcase
  end

  def increase_num_of_times_used
    update(num_of_times_used: self.num_of_times_used +=1)
  end

  def to_param
    content
  end

end
