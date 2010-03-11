atom_feed :schema_date => 2009 do |feed|
  feed.title("Ruby on Rails - delovna mesta")
  feed.subtitle("Delovna mesta za slovenske rubyiste")
  feed.updated(@jobs.first.updated_at) if @jobs.any?

  @jobs.each do |job|
    feed.entry(job) do |entry|
      entry.title("#{job.title} pri #{job.organization}")
      entry.content "type" => "html" do
        xml.text!("<strong>Lokacija:</strong> #{job.location}")
        xml.text!(job.cached_description_html)
      end
      
      entry.author do |author|
        author.name("Ruby on Rails Slovenija")
      end
    end
  end
end
