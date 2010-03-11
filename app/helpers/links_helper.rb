module LinksHelper
  def link_to_each(resources)
    resources.collect { |resource| link_to(h(resource.to_s), resource) }
  end
  
  def link_with_span_to(text, uri, options = {})
    link_to content_tag(:span, text), uri, options    
  end

  def link_to_back(id=nil)
    content_tag :p, link_to("Nazaj", (id) ? object_path(id) : collection_path), :class => 'backlink'
  end
  
  def link_to_mail(email)
    link_to email, "mailto:#{email}"    
  end

  def link_to_self(uri)
    link_to uri, uri
  end
  
  def link_to_lightbox(string, image, album = 'album', title = '')
    ret = "<a href='#{image}' rel='lightbox[#{album}]'"
    ret += " title='#{title}'" unless title.blank?
    ret += "class='lightbox'>#{string}</a>"
  end
  
  def link_to_github(username = 'rails')
    link_to username, "http://github.com/#{username}", :title => "#{username} on GitHub"
  end
  
  def link_to_twitter(username = 'rails')
    link_to username, "http://twitter.com/#{username}", :title => "#{username} on Twitter"
  end
    
end
