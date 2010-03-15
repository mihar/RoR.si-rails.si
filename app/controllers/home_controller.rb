class HomeController < ApplicationController

  def index
    @upcoming_event         = Event.next(1).first
    @recent_presentations   = Presentation.limited 2
    @recent_topics          = Topic.recent 6
    @recent_tweets          = Tweet.recent 3
    @recent_blogs           = Entry.recent 10
    @recent_apps            = App.all.sort_by(&:rand)[0..6]     
    @users                  = User.all.sort_by(&:rand)[0..6]
    # @recent_jobs            = Job.all
    # @features_project       = Project.featured
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
    @users                  = User.all.sort_by(&:rand)
    @apps                   = App.all
    @projects               = Project.all.sort_by(&:rand)
  end

end
