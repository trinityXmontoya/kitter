require 'spec_helper'

describe Tweet do

  it {should belong_to :user}
  it {should have_many :replies}
  it {should have_many :favorites}
  it {should have_many :retweets}
  it {should have_and_belong_to_many :hashtags}

  it {should validate_presence_of :content}
  it {should validate_presence_of :user_id}
  it {should validate_presence_of :num_of_favs}
  it {should validate_presence_of :num_of_retweets}

end
