class UserMailer < ActionMailer::Base

  default from: "kittercatteam@gmail.com"

  def send_user_token(user,login_link)
    @user = user
    @link = root_url + login_link
    mail(to: @user.email,
         subject: "Login")
  end

end
