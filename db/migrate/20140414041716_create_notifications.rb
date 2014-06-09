class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications , id: false do |t|
      t.string :kind
      t.references :user
      t.references :poster
      t.references :tweet

      t.timestamps
    end
  end
end
