class AddDefaultValueNumOfTimesUsedToHashtags < ActiveRecord::Migration
  def change
    change_column :hashtags, :num_of_times_used, :integer, default: 1
  end
end
