class AddPermalinkToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :permalink, :string
    App.all.each { |a| a.permalink = ""; a.save }
  end

  def self.down
    remove_column :apps, :permalink
  end
end
