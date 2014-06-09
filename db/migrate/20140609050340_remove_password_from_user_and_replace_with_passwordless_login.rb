class RemovePasswordFromUserAndReplaceWithPasswordlessLogin < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    add_column :users, :auth_token, :string
    add_column :users, :auth_token_created_at, :datetime
    add_column :users, :login_link_sent, :datetime
  end
end
