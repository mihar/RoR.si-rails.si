class AddUserIdToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :user_id, :integer
  end

  def self.down
    remove_column :apps, :user_id
  end
end
