require 'spec_helper'

describe Reply do
  it {should belong_to :user}
  it {should belong_to :tweet}

  it {should validate_presence_of :content}
  it {should validate_presence_of :user_id}
  it {should validate_presence_of :tweet_id}

end
