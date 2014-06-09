class SessionsController < ApplicationController

  def new
  end

  def request_token
    @user = User.find_by(username: params[:user_id])
    if @user
      @user.send_login_link
      redirect_to login_path, notice: "Your email was sent."
    else
      redirect_to login_path, notice: "Whoops! Looks like you didn't select a username. Try again."
    end
  end

  def create
    @user = User.find_by(username: params[:user_id])
    if @user && @user.validate_token(params[:auth_token])
      session[:user_id] = @user.id
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
