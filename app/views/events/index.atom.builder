atom_feed :schema_date => 2009 do |feed|
  feed.title("Ruby on Rails - prihajajoči dogodki")
  feed.subtitle("Prihajajoči dogodki za slovenske rubyiste")
  feed.updated(@events.first.updated_at)

  @events.each do |event|
    feed.entry(event) do |entry|
      entry.title(event.title)
      entry.content(event.description_html, :type => 'html')
      entry.author do |author|
        author.name("Ruby on Rails Slovenija")
      end
    end
  end
end
