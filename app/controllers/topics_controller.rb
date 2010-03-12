class TopicsController < InheritedResources::Base
  include RestrictToOwner
  
  actions :all, :except => :show
  
  def new
    @topic = Topic.new
    @topic.posts.build :user => current_user
    super
  end
  
  def create
    @topic = Topic.new params[:topic]
    @topic.user = current_user
    create! { topic_posts_path(@topic) }
  end
  
  def update
    update! { topic_posts_path(@topic) }
  end
  
  def destroy
    destroy! { topics_path }
  end
  
  protected
  
  def collection
    @topics ||= end_of_association_chain.paginate(:page => params[:page])
  end
  
end
