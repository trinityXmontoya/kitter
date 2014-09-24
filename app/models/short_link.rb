class ShortLink < ActiveRecord::Base

  before_save :generate_short_url

  def generate_short_url
    path = SecureRandom.urlsafe_base64(6)
    ShortLink.exists?(short_url_path: path) ? generate_short_url : path
    self.short_url_path = path
  end

end
