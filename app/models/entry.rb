class Entry < ActiveRecord::Base
  include Pacecar
  include Feedra::Entry
  
  default_scope :order => "published_at desc"
  
  before_save :make_short_summary

  def self.recent(limit)
    limited(limit).by_published_at(:desc).by_created_at(:desc)
  end
  
  protected
  
  def make_short_summary
    self.short_summary = summary.strip_tags.shorten(255)
  end
  
end
