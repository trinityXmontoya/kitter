require 'spec_helper'

describe Hashtag do
  it {should have_and_belong_to_many :tweets}
  it {should validate_presence_of :content }
  it {should validate_presence_of :num_of_times_used}
end
