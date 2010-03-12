module ApplicationHelper

  def sentence_of(things, opts = {}, &block)
    if block
      things = things.collect do |thing|
        capture(thing, &block)
      end
    end

    if opts[:connector] == :or
      things.to_sentence :last_word_connector => ", or ",
                         :two_words_connector => " or "
    else
      things.to_sentence
    end
  end
  
  def restrict_to_owner(resource, &block)
    if current_user and current_user.send("owns_#{resource.class.to_s.downcase}?", resource)
      concat capture(&block)
    end
  end
  
  def restrict_to_admin(&block)
    if current_user and current_user.admin?
      concat capture(&block)    
    end
  end

end
