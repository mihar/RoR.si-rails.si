class PostsController < InheritedResources::Base
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
    @posts ||= end_of_association_chain.by_created_at(:desc).paginate(:page => params[:page])
  end
  
end
