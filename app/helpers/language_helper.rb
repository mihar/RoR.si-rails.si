module LanguageHelper
  def pluralize_jobs(n)
    case n
    when 1
      "1 delovno mesto"
    when 2
      "2 delovni mesti"
    when 3..4
      "#{n} delovna mesta"
    else
      "#{n} delovnih mest"
    end
  end
  
  def pluralize_apps(n)
    case n
    when 1
      "1 aplikacija"
    when 2
      "2 aplikaciji"
    when 3..4
      "#{n} aplikacije"
    else
      "#{n} aplikacij"
    end
  end  
  
  def pluralize_users(n)
    case n
    when 1
      "1 razvijalec"
    when 2
      "2 razvijalca"
    when 3..4
      "#{n} razvijalci"
    else
      "#{n} razvijalcev"
    end
  end
  
  def pluralize_events(n)
    case n
    when 1
      "1 dogodek"
    when 2
      "2 dogodka"
    when 3..4
      "#{n} dogodki"
    else
      "#{n} dogodkov"
    end
  end
  
  def pluralize_presentations(n)
    case n
    when 1
      "1 predavanje"
    when 2
      "2 predavanja"
    when 3..4
      "#{n} predstavitve"
    else
      "#{n} predstavitev"
    end
  end
  
  def pluralize_projects(n)
    case n
    when 1
      "1 projekt"
    when 2
      "2 projekta"
    when 3..4
      "#{n} projekti"
    else
      "#{n} projektov"
    end
  end
  
  def pluralize_posts(n)
    case n
    when 1
      "1 sporočilo"
    when 2
      "2 sporočili"
    when 3..4
      "#{n} sporočila"
    else
      "#{n} sporočil"
    end
  end
  
  def pluralize_topics(n)
    case n
    when 1
      "1 diskusija"
    when 2
      "2 diskusiji"
    when 3..4
      "#{n} diskusije"
    else
      "#{n} diskusij"
    end
  end
end