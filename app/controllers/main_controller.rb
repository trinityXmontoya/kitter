class MainController<ApplicationController

  before_action :authenticate, only: [:welcome]

  def welcome
    @user=current_user
    @tweets=Tweet.order(updated_at: :desc).includes(:user)
    @tweet=Tweet.new
    @path=[@user,@tweet]
    two_column_layout
  end

  def join
    redirect_to action: 'welcome' if current_user
  end

  def faq
  end

end
