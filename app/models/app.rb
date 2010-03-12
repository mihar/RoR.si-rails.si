class App < ActiveRecord::Base
  include Permalink

  belongs_to :user
  validates_presence_of :name
  validates_url_format_of :homepage_url, :message => "is invalid"

  named_scope :all, :order => 'name asc'

  def to_s
    name
  end

  def self.featured
    self.random
  end
end
