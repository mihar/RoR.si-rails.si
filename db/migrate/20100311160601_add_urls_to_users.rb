class AddUrlsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :homepage, :string
    add_column :users, :linkedin, :string
    add_column :users, :about, :text
  end

  def self.down
    remove_column :users, :about
    remove_column :users, :linkedin
    remove_column :users, :homepage
  end
end
