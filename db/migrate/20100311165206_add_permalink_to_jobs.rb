class AddPermalinkToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :permalink, :string
    Job.all.each { |j| j.permalink = ""; j.save }
  end

  def self.down
    remove_column :jobs, :permalink
  end
end
