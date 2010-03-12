class EventsController < InheritedResources::Base
  actions :new, :edit, :show, :create, :update, :destroy
  include RestrictToOwner
  
  def index
    respond_to do |wants|
      wants.html { @events = Event.paginate_by_date params[:page] }
      wants.atom { @events = Event.next(10) }
      wants.rss  { redirect_to :format => :atom }
    end
  end
  
  def new
    @event = Event.new :user => current_user
    new! { events_and_presentations_path }
  end

  def create
    create! { events_and_presentations_path }
  end

  def destroy
    destroy! { events_and_presentations_path }
  end

  def copy
    @template_event = resource
    @event = @template_event.clone
    render :action => :new
  end
end
