class AddTopicIdAndMeetupUrlToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :topic_id, :integer
    add_column :events, :meetup_url, :string
  end

  def self.down
    remove_column :events, :meetup_url
    remove_column :events, :topic_id
  end
end
