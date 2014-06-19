class ShortLink < ActiveRecord::Base

  after_create :generate_short_url

  def generate_short_url
    puts "Generating url"
    path = SecureRandom.urlsafe_base64(6)
    # puts path
    # ShortLink.where("short_url_path = ?", path).exists? ? generate_short_url : path
  end

end
