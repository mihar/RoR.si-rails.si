class Job < ActiveRecord::Base
  include Pacecar
  include Permalink

  validates_presence_of :location, :organization, :title
  has_markup :description, :required => true, :cache_html => true

  def to_s
    title    
  end
  
  def self.featured
    self.random
  end
end
