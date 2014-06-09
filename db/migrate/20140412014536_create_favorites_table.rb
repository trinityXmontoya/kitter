class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites, id: false do |t|
      t.references :tweet, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
