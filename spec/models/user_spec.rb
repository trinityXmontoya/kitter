require 'spec_helper'

describe User do

  subject {FactoryGirl.create(:user)}

  it{should have_many :tweets}
  it{should have_and_belong_to_many :followers}
  it{should have_and_belong_to_many :blocked_users}
  it{should have_many :replies}
  it{should have_many :retweets}
  it{should have_many :favorites}
  it{should have_many(:retweets).through(:tweets)}
  it{should have_many(:replies).through(:tweets)}
  it{should have_many(:favorites).through(:tweets)}

  it{should validate_presence_of :name}
  it{should validate_presence_of(:username)}
  it{should validate_presence_of :email}
  it{should validate_presence_of :bio}
  it{should validate_presence_of :website}
  it{should validate_presence_of :location}
  it{should validate_presence_of :country_id}

  # it{should validate_presence_of(:background_photo_url).on(:create)}
  # it{should validate_presence_of(:profile_photo_url).on(:create)}
  # it{should validate_presence_of(:verified).on(:create)}

  it{should validate_numericality_of(:country_id).only_integer}

  it{should ensure_length_of(:username).is_at_most(15)}

  it{should validate_uniqueness_of(:username).case_insensitive}
  it{should validate_uniqueness_of(:email)}


  it{should validate_correct_email_format_of(:email)}
  # validates :username, format: {with: /\w/, message: "Usernames may only contain numbers, letters, or underscores."}

end



