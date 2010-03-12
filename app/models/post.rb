class Post < ActiveRecord::Base
  include Pacecar

  belongs_to :topic, :counter_cache => true, :dependent => :destroy
  belongs_to :user
  has_markup :body, :required => true, :cache_html => true
  
  validates_presence_of :body, :user
end
