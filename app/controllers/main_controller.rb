class MainController<ApplicationController

  before_action :authenticate, only: [:welcome]

  def welcome
    @user=current_user
    users = User.select(:profile_photo_url,:username, :name).reject {|user| @user.followings.include?(user)}
    @users=users.sample(3)
    @hashtags=Hashtag.cached_top_ten
    @tweets=Tweet.order('updated_at DESC').includes(:user)
    @tweet=Tweet.new
    @path=[@user,@tweet]
  end

  def faq
  end

end
