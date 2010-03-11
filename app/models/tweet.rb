class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :twitter_id, :text, :tweeted_at, :user_id
  default_scope :order => "tweeted_at desc"

  def self.recent(number)
    limited(number)
  end
end
