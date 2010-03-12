class PostsController < InheritedResources::Base
  include RestrictToOwner
  belongs_to :topic
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    @post.topic_id = params[:topic_id]
    create! { topic_posts_path }
  end
  
  def update
    update! { topic_posts_path }
  end
  
  def destroy
    destroy! { topic_posts_path }
  end
  
  protected
  
  def collection
    @posts ||= end_of_association_chain.paginate(:per_page => 20, :page => params[:page])
  end
  
end
