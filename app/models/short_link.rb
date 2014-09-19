class ShortLink < ActiveRecord::Base

  after_create :generate_short_url

  def generate_short_url
    puts "Generating url"
    path = SecureRandom.urlsafe_base64(6)
    ShortLink.exists?(short_url_path: path) ? generate_short_url : path
    self.update_column(:short_url_path, path)
  end

end
