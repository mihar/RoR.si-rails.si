class AddPermalinkToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :permalink, :string
    Presentation.all.each { |p| p.permalink = ""; p.save }
  end

  def self.down
    remove_column :presentations, :permalink
  end
end
