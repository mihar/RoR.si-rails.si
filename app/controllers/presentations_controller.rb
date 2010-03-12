class PresentationsController < InheritedResources::Base
  include RestrictToOwner
  actions :new, :create, :edit, :update, :destroy, :show, :index

  def new
    @presentation = Presentation.new :user => current_user, :speaker => current_user
    new! { events_and_presentations_path }
  end

  def create
    create! { events_and_presentations_path }
  end

  def destroy
    destroy! { events_and_presentations_path }
  end
  
  protected
  
  def collection
    @presentations ||= end_of_association_chain.paginate(:page => params[:page])
  end

end
