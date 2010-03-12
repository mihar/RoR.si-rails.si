class Topic < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 30
  
  include Pacecar
  include Permalink
  
  has_many :posts, :order => "posts.created_at asc"
  belongs_to :user
  
  accepts_nested_attributes_for :posts
  validates_presence_of :title, :user
  
  default_scope :order => "created_at desc"
  
  def self.recent(limit)
    limited(limit).by_updated_at(:desc).by_created_at(:desc)
  end
  
  def to_s
    title
  end
  
  def anchor
    "t#{id}"
  end
  
  def page
    count = Topic.count
    if @@per_page and @@per_page < count
      count / @@per_page
    else
      1
    end
  end
end
