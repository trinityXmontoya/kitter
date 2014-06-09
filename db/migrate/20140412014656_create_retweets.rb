class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets, id: false do |t|
      t.references :tweet, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
