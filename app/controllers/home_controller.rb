class HomeController < ApplicationController

  def index
    @upcoming_event         = Event.next(1).first
    @recent_presentations   = Presentation.all.sort_by(&:rand)[0..1]
    @recent_topics          = Topic.recent 6
    @recent_tweets          = Tweet.recent 3
    @recent_blogs           = Entry.recent 10
    @recent_apps            = App.all.sort_by(&:rand)[0..5]     
    @users                  = User.all.sort_by(&:rand)[0..5]
    # @recent_jobs            = Job.all
    # @features_project       = Project.featured
  end
  
  def events_and_presentations
    @events = Event.all
    @presentations = Presentation.all.sort_by(&:rand)
  end
  
  def blogs_and_tweets
    @blogs = Entry.recent(10)
    @tweets = Tweet.recent(15)
  end
  
  def developers_and_apps
    @apps                   = App.all
    @users                  = User.all.sort_by(&:rand)
    @projects               = Project.all.sort_by(&:rand)
  end

end
