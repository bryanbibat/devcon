atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @entries.each do |item|
    next if item.updated_at.blank?

    if item.kind_of?(Article)
      feed.entry( item, :url => article_url(item) ) do |entry|
        entry.title "#{item.class.to_s} | #{item.title}"
        entry.summary item.summary
        # the strftime is needed to work with Google Reader.
        entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      end
    else
      feed.entry( item, :url => event_url(item) ) do |entry|
        entry.title "#{item.class.to_s} | #{item.name}"
        entry.summary item.summary
        # the strftime is needed to work with Google Reader.
        entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      end
    end
  end
end
