class SessionsController < ApplicationController

  def new
  end

  def create
    #login with username or email

    if params[:username_or_email].include? "@"
      @user = User.find_by(email: params[:username_or_email])
    else
      @user=User.find_by(username: params[:username_or_email])
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to @user
    else
      flash[:notice]="USER NOT FOUND. Double check login info."
      render 'new'
    end

  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end

end
