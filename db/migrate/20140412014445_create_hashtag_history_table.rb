class CreateHashtagHistoryTable < ActiveRecord::Migration
  def change
    create_table :hashtag_history do |t|
      t.references :tweet
      t.references :hashtag
    end
  end
end
