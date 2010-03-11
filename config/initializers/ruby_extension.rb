class String

  def make_websafe
    self.strip.gsub('d.d.', '').gsub('d.o.o.', '').strip.debalkanize.downcase.gsub(' ', '-').gsub(',', '').gsub('.', '').strip
  end

  def debalkanize
    self.gsub('Č', 'C').gsub('Š', 'S').gsub('Ž', 'Z').gsub('Ć', 'C').gsub('Đ', 'D').gsub('č', 'c').gsub('š', 's').gsub('ž', 'z').gsub('ć', 'c').gsub('đ', 'd')
  end

  def debalkanize!
    replace self.debalkanize
  end

  def make_file_system_friendly
    self.strip.debalkanize.downcase.gsub(' ', '_')
  end
  
  def strip_tags
    self.gsub(/<\/?[^>]*>/, "")
  end
  
  def shorten(count = 30, dots = true)
  	if self.length >= count 
  		shortened = self[0, count]
  		splitted = shortened.split(/\s/)
  		words = splitted.length
  		shortened = splitted[0, words-1].join(" ")
  		shortened += "..." if dots
  		shortened
  	else 
  		self
  	end
  end
  
end