class AddDefaultProfilePhotoUrlAndBackgroundPhotoUrlToUser < ActiveRecord::Migration
  def change
    change_column :users, :profile_photo_url, :string, default: 'http://img2.wikia.nocookie.net/__cb20130302002623/glee/images/5/50/20120814044316!Pusheen.png'
    change_column :users, :background_photo_url, :string, default: "http://static2.grsites.com/archive/textures/ss/ss013.jpg"
  end
end
