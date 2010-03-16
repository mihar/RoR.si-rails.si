class Event < ActiveRecord::Base
  include Pacecar
  include Permalink

  belongs_to :user
  belongs_to :topic
  has_many :attendances, :dependent => :destroy
  validates_presence_of :date, :title, :location
  after_create :create_topic

  has_markup :description,
    :required   => true,
    :cache_html => true

  has_markup :summary,
    :required   => false,
    :cache_html => true

  before_save      :geocode_location
  acts_as_mappable :default_units => :miles

  default_scope :order => "date desc"

  named_scope :next, lambda {|*args|
    limit = args.first || 1
    { :conditions => ['date > ?', DateTime.now],
      :order      => 'date asc',
      :limit      => limit }
  }

  named_scope :recurring, :conditions => { :recurring => true }
  named_scope :special,   :conditions => { :recurring => false }
  named_scope :with_meetup, :conditions => "meetup_url IS NOT NULL and meetup_url != ''"

  def to_s
    title
  end

  def lat_lng_pair
    [lat, lng]
  end

  def geocoded?
    lat && lng
  end

  def front_page_copy
    @front_page_copy ||= cached_summary_html || truncated_cached_description_html
  end

  def truncated_cached_description_html
     @truncated_cached_description_html ||= TruncateHtml::HtmlTruncator.new(self.cached_description_html).truncate(:length => 400)
  end

  def self.per_page
    8
  end

  def self.paginate_by_date(page)
    by_date(:desc).paginate(:page => page)
  end

  protected

  def geocode_location
    geo = GeoKit::Geocoders::MultiGeocoder.geocode(location)
    if geo.success
      self.lat = geo.lat
      self.lng = geo.lng
    end
  end
  
  def create_topic
    @topic = Topic.new
    @topic.title = "Dogodek: #{title}"
    @topic.user = user
    @topic.posts.build(:user => user, :body => "Diskusija o dogodku na #{date.to_s(:short)} [&raquo;#{title}&laquo;](/dogodki/#{to_param})\n\n#{description}")
    @topic.save
    self.topic = @topic
    self.save
  end

end
