class HomeController < ApplicationController

  def index
    @upcoming_event         = Event.next(1).first
    @recent_presentations   = Presentation.ordered.limited 3
    @recent_topics          = Topic.recent 6
    @recent_tweets          = Tweet.recent 3
    @recent_blogs           = Entry.recent 6
    @recent_apps            = App.ordered("created_at desc").limited 6 
    @recent_jobs            = Job.ordered.limited 6
    
    @users                  = User.ordered("updated_at desc").limited(6)
  end
  
  def events_and_presentations
    @events = Event.all
    @presentations = Presentation.all
  end
  
  def blogs_and_tweets
    @blogs = Entry.recent(10)
    @tweets = Tweet.recent(15)
  end
  
  def developers_and_apps
    @users                  = User.ordered("updated_at desc")
    @apps                   = App.all
  end

end
