class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    # User.find(7)
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def authenticate
    unless current_user
      redirect_to login_path, notice: "You must login to perform that action"
    end
  end
end
