module Cron
  include HTTParty
  
  def self.get_tweets
    client = TwitterSearch::Client.new
    users  = User.with_twitter
    users.each do |user|
      tweets = client.query "from:#{user.twitter}"
      tweets.each do |tweet|
        unless Tweet.find_by_twitter_id(tweet.id)
          user.tweets.create(:text       => CGI::unescapeHTML(tweet.text),
                             :twitter_id => tweet.id,
                             :tweeted_at => tweet.created_at)
        end
      end
    end
  end

  def self.get_projects
    User.with_github.each do |user|
      Github::User.find(user.github).repositories.each do |repo|
        unless repo.fork
          project = Project.find_or_initialize_by_name(repo.name)
          project.watchers    = repo.watchers
          project.name        = repo.name
          project.description = repo.description
          project.github_url  = repo.url
          project.user        = user
          project.save
        end
      end
    end
  end
  
  def self.get_attending
    base_uri 'api.meetup.com'
    Event.with_meetup.map do |event|
      meetup_id = event.meetup_url.split("/").last
      attending = get("/rsvps", :query => {:event_id => meetup_id, :key => '2639777e374c791b366c38cf33c28'})['results']
      attending = attending.map do |user|
        if user['response'] == 'yes'
          Attendance.add :user => user['name'], :event => event
        end
      end
    end
  end
end
