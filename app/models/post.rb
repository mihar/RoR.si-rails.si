class Post < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  
  include Pacecar

  belongs_to :topic, :counter_cache => true
  belongs_to :user
  has_markup :body, :required => true, :cache_html => true
  
  after_save :update_topic_timestamp
  
  validates_presence_of :body, :user #, :topic
  # Flaw in validation disallows creating topic if post.topic_id == nil
  
  def anchor
    "p#{id}"
  end
  
  def page
    count = topic.posts.count
    if @@per_page and @@per_page < count
      count / @@per_page
    else
      1
    end
  end
  
  protected

  def update_topic_timestamp
    topic.updated_at = Time.now
    topic.save
  end

end
