module LayoutHelper  
  def javascripts(*args)
    content_for(:head) do
     javascript_include_tag(*args)
    end
  end
  
  def body_attrs
    classes = [controller.controller_name]
    { :class => classes.join(" "), :id => "#{controller.controller_name}-#{controller.action_name}" }
  end
  
  def destroy_confirmation(obj)
    if obj.respond_to? :title
     str = obj.title
    elsif obj.respond_to? :name
     str = obj.name
    else
     str = obj.id
    end

    "'#{str}' - Ste prepričani o izbrisu?"
  end
  
  def title(_title, heading = true, class_name = "")
    default = "Ruby on Rails Slovenija"
    title = (_title) ? "#{_title} (#{default})" : default
    content_for(:title) { title }
    content_for(:content_title) { _title }
    
    unless not heading
      if (class_name.size > 0)
        content_tag :h1, _title, {:class => class_name}
      else
        content_tag :h1, _title
      end
    end
  end
end