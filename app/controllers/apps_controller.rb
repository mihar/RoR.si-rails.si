class AppsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy

  def new
    @app = App.new :user => current_user
    new! { root_url }
  end
  
  def create
    create! { root_url }
  end

  def destroy
    destroy! { root_url }
  end

end
