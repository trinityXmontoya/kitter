class SessionsController < ApplicationController

  def new
  end

  def validate_input
    puts "VALIDATING YR INPUT"
    if params[:type] == 'email'
      user = User.find_by_email(params[:user][:email])
    elsif params[:type] == 'username'
      user = User.cached_find(params[:user][:username])
    end
    respond_to do |format|
      if current_user && current_user == user
        format.json { render :json => true }
      else
        format.json { render :json => !user}
      end
    end
  end

  def request_token
    lookup = params[:user_id]
    if lookup.include? '@'
      @user = User.cached_find_by_email(lookup)
    else
      @user = User.cached_find(lookup)
    end
    if @user
      @user.send_login_link
      redirect_to root_path, notice: "#{@user.username.capitalize} your email was sent!"
    else
      redirect_to root_path, notice: "Whoops! Looks like #{lookup} is not registered on this site. Please check spelling or signup!"
    end
  end

  def create
    @user = User.cached_find(params[:user_id])
    if @user && @user.validate_token(params[:auth_token])
      session[:user_id] = @user.username
      redirect_to root_path, notice: "Welcome " + @user.username
    else
      redirect_to root_path, notice: "Error logging in.\nPerhaps your login link expired!\nYou can resend yourself one below."
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:user_id,:auth_token)
  end

end
