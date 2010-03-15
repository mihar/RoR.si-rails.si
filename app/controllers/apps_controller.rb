class AppsController < InheritedResources::Base
  actions :new, :create, :edit, :update, :destroy

  def new
    @app = App.new :user => current_user
    new! { developers_and_apps_path }
  end
  
  def update
    update! { developers_and_apps_path }
  end
  
  def create
    create! { developers_and_apps_path }
  end

  def destroy
    destroy! { developers_and_apps_path }
  end

end
