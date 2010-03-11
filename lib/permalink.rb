module Permalink
  def self.included(base)
    base.class_eval {
      before_save :make_permalink
      
      def to_param
        "#{id}-#{permalink}"
      end

      def make_permalink
        separator = '-'
        
        # words to ignore, usually the same words ignored by search engines
        ignore_words = ['in', 'ter']
        ignore_re    = String.new

        # building ignore regexp
        ignore_words.each{ |word|
          ignore_re << word + '\b|\b'
        }
        ignore_re = '\b' + ignore_re + '\b'

        # replace apostrophes with separator
        permalink = to_s.gsub("'", separator)

        # delete ignore words
        permalink.gsub!(ignore_re, '')

        # all down
        permalink.downcase!

        # shift whitespace and preserve all alphanumeric characters
        self.permalink = permalink.strip.debalkanize.gsub(" ", separator).gsub(/[^a-z0-9\-]+/, "")
      end
    }
  end
end