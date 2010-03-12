class Project < ActiveRecord::Base
  include Pacecar

  belongs_to :user

  default_scope :order => 'name asc'
  named_scope :recent, :order => "updated_at desc"

  validates_presence_of :name, :user_id
  validates_url_format_of :github_url, :message => "is invalid"

  def to_s
    name
  end

  def self.featured
    self.random
  end

  def self.per_page
    10
  end

  named_scope :all_except, lambda { |project|
    { :conditions => ['id <> ?', project],
      :order => 'name asc' }
  }
end
