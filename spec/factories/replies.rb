# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reply do
    user nil
    tweet nil
    content "MyString"
  end
end
