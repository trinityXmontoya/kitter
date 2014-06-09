# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    type ""
    poster_id 1
    tweet_id 1
  end
end
