class Topic < ActiveRecord::Base
  include Pacecar
  include Permalink
  
  has_many :posts
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
end
