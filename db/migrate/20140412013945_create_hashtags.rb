class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :num_of_times_used
      t.string :content

      t.timestamps
    end
  end
end
