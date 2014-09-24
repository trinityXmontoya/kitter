class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    session[:user_id] ? User.cached_find(session[:user_id]) : nil
  end

  def authenticate
    unless current_user
      redirect_to root_path, notice: "You must login to perform that action"
    end
  end

  def two_column_layout
    users = User.select(:profile_photo_url,:username, :name).reject {|user| current_user.followings.include?(user)}
    @users=users.sample(3)
    @hashtags=Hashtag.cached_top_ten
    render :layout => 'two_column'
  end
end
