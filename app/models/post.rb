class Post < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  
  include Pacecar

  belongs_to :topic, :counter_cache => true
  belongs_to :user
  has_markup :body, :required => true, :cache_html => true
  
  validates_presence_of :body, :user, :topic
  
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

end
