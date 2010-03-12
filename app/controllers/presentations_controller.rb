class PresentationsController < InheritedResources::Base
  include RestrictToOwner
  actions :new, :create, :edit, :update, :destroy, :show, :index

  def new
    @presentation = Presentation.new :user => current_user, :speaker => current_user
    new! { root_url }
  end

  def create
    create! { root_url }
  end

  def destroy
    destroy! { root_url }
  end
  
  protected
  
  def collection
    @presentations ||= end_of_association_chain.paginate(:page => params[:page])
  end

end
