class AddPermalinkToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :permalink, :string
  end

  def self.down
    remove_column :events, :permalink
  end
end
