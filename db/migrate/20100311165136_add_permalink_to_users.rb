class AddPermalinkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :permalink, :string
    User.all.each { |u| u.permalink = ""; u.save }
  end

  def self.down
    remove_column :users, :permalink
  end
end
