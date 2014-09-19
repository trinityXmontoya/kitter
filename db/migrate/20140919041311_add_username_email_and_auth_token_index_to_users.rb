class AddUsernameEmailAndAuthTokenIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :username
    add_index :users, :email
    add_index :users, :auth_token
  end
end
