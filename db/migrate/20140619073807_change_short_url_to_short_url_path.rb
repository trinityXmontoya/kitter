class ChangeShortUrlToShortUrlPath < ActiveRecord::Migration
  def change
    remove_column :short_links, :short_url
    add_column :short_links, :short_url_path, :string, null: :false
  end
end
