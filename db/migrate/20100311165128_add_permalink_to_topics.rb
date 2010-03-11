class AddPermalinkToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :permalink, :string
    Topic.all.each { |t| t.permalink = ""; t.save }
  end

  def self.down
    remove_column :topics, :permalink
  end
end
