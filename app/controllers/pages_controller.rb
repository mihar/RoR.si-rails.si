class PagesController < ApplicationController

  before_filter :ensure_valid

  def show
    # raise current_page.inspect
    if current_page == "pages/test"
      render :template => current_page, :layout => "pagetest"
    else
      render :template => current_page
    end
  end

  def test
    render :layout => "pagetest"
  end
  
  protected

  def current_page
    "pages/#{params[:id].to_s.downcase}"
  end

  def ensure_valid
    unless template_exists?(current_page)
      render :nothing => true, :status => :not_found and return false
    end
  end

  def template_exists?(path)
    self.view_paths.find_template(path, response.template.template_format)
  rescue ActionView::MissingTemplate
    false
  end

end
