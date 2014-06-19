class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :orig_url
      t.string :short_url
    end
  end
end
