class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :background_photo_url
      t.string :profile_photo_url
      t.string :bio
      t.string :website
      t.boolean :verified
      t.string :location
      t.string :password_digest
      t.integer :country_id

      t.timestamps
    end
  end
end
