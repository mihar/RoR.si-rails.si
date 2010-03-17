class ApplicationController < ActionController::Base
  #TODO redirect to correct action after logging in because of before_filter :authenticate

  helper :all
  protect_from_forgery

  include Clearance::Authentication

  before_filter :authenticate,
    :only => [:new, :create, :edit, :copy, :update, :destroy]

  protected

  def user_session
    @user_session ||= UserSession.new(session)
  end
  
  def body_attrs
    {:id => controller_name, :class => "#{controller_name}-#{action_name}"}
  end
  
  helper_method :user_session
end
