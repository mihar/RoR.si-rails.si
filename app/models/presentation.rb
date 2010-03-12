class Presentation < ActiveRecord::Base
  include Permalink
  has_markup :description, :cache_html => true
  belongs_to :user
  default_scope :order => "created_at desc"

  def to_s
    title
  end

  def self.featured
    self.random
  end

  def presenter
    user || other_speakers
  end

  def self.latest
    first :order => 'updated_at desc'
  end
end
