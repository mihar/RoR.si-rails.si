class Attendance < ActiveRecord::Base
  belongs_to :event
  
  def self.add(params={})
    unless find_by_user_and_event_id(params[:user], params[:event].id)
      create(:user => params[:user], :event_id => params[:event].id)
    end
  end
end
