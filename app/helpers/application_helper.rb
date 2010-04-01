module ApplicationHelper
  
  def restrict_to_owner(resource, &block)
    if current_user and (current_user.send("owns_#{resource.class.to_s.downcase}?", resource) or current_user.admin?)
      concat capture(&block)
    end
  end
  
  def restrict_to_admin(&block)
    if current_user and current_user.admin?
      concat capture(&block)    
    end
  end

end
