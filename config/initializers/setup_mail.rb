Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.gmail.com',
    :port => '587',
    :domain => 'gmail.com',
    :user_name => ENV['EMAIL_USERNAME'],
    :password => ENV['EMAIL_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

# Pony.options = {
#   :via => :smtp,
#   :via_options => {
#     :address => 'smtp.sendgrid.net',
#     :port => '587',
#     :domain => 'heroku.com',
#     :user_name => ENV['SENDGRID_USERNAME'],
#     :password => ENV['SENDGRID_PASSWORD'],
#     :authentication => :plain,
#     :enable_starttls_auto => true
#   }
# }
