class AddShortSummaryToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :short_summary, :text
  end

  def self.down
    remove_column :entries, :short_summary
  end
end
