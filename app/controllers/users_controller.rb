class UsersController < ApplicationController

  before_action :authenticate, only: [:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def show
    @user=User.cached_find(params[:id])
    retweets = @user.retweeted_tweets
    @tweets=(@user.tweets.includes(:user)+retweets)
    @tweets=@tweets.sort_by{|tweet| tweet.updated_at}.reverse
    retweets = @user.retweeted_tweets
    @tweets=(@user.tweets.includes(:user)+retweets)
    @tweets=@tweets.sort_by{|tweet| tweet.updated_at}.reverse
    init_const_vars
    render_user_static_layout
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.username
      redirect_to @user, notice: "User created. Get kitting!"
    else
      redirect_to root_path
    end
  end

  def edit
    @user=User.cached_find(params[:id])
  end

  def update
    @user=User.cached_find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user=User.cached_find(params[:id])
    session[@user.id]=nil
    @user.destroy
    redirect_to root_path
  end

  def notifications
    @user=User.cached_find(params[:user_id])
    notifications=@user.notifications
    replies = @user.tweet_replies
    @all_notifications = (notifications + replies)
    # puts "REPLIES"
    # puts replies
    # puts "NOTIFICATIONS"
    # puts @all_notifications
    # puts @all_notifications.each {|n| n}
    # @all_notifications = (notifications + replies).sort_by{|notification| notification.updated_at}.reverse

  end

  def followers
    @user=User.cached_find(params[:user_id])
    init_const_vars
    @followers = @user.followers
    render_user_static_layout
  end

  def following
    @user=User.cached_find(params[:user_id])
    puts @user.followings
    @followings = @user.followings
    init_const_vars
    render_user_static_layout
  end

  def favorites
    @user = User.cached_find(params[:user_id])
    @favorites = @user.favorited_tweets.order(updated_at: :desc)
    init_const_vars
    render_user_static_layout
    if @favorites.empty?
      flash[:notice] = "Sorry! Looks like #{@user.username} hasn't favorited anything yet. Guess you'd better step up your kitting game"
    end
  end

  def follow
    other_user = User.cached_find(params[:user_id])
    current_user.follow(other_user)
    redirect_to other_user, notice: "You are now following #{other_user.username}! Good luck."
  end

  def unfollow
    other_user = User.cached_find(params[:user_id])
    current_user.unfollow(other_user)
    redirect_to other_user, notice: "Congratulations. You have unfollowed #{other_user.username}."
  end

  def block
    other_user = User.cached_find(params[:user_id])
    current_user.block(other_user)
    redirect_to other_user, notice: "You have blocked #{other_user.username}, finally."
  end

  def unblock
    other_user = User.cached_find(params[:user_id])
    current_user.unblock(other_user)
    redirect_to other_user, notice: "You have unblocked #{other_user.username}! Good to see you two getting back together."
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :bio, :website, :verified, :location, :country_id,:profile_photo_url, :background_photo_url)
  end

  def init_const_vars
    @hashtags = Hashtag.cached_top_ten
    @path = @user, Tweet.new
    puts "About to sort through users"
    users = User.all.reject {|user| @user.followings.include?(user)}
    @users=users.sample(3)
  end

  def render_user_static_layout
    render :layout => 'user_static'
  end

end
