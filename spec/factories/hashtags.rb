# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hashtag do
    num_of_times_used 1
    content "MyString"
  end
end
