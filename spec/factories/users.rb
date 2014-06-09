# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "joeschmoe"
    name "joe"
    email "joe@schmoe.com"
    background_photo_url "jpeg.jpeg"
    profile_photo_url "jpeg.jpg"
    bio "just yr avg joe"
    website "avejoe.com"
    verified true
    location "NYC"
    password "factory88"
    password_confirmation "factory88"
    country_id 1
  end
end
