class MainController<ApplicationController

  before_action :authenticate, only: [:welcome]

  def welcome
    @user=current_user
    users = User.all.reject {|user| @user.followings.include?(user)}
    @users=users.sample(3)
    @hashtags=Hashtag.all.sample(10)
    @tweets=Tweet.all.order('updated_at DESC')
    @tweet=Tweet.new
    @path=[@user,@tweet]
  end

  def faq
  end

end
