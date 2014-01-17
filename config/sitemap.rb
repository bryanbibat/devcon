# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://devcon.ph"

SitemapGenerator::Sitemap.create do
  add faq_path
  add contact_path

  add articles_path, :priority => 0.7

  Article.all.each do |article|
    add article_path(article), :lastmod => article.updated_at
  end

  add events_path, :priority => 0.7, :changefreq => "daily"
  add previous_events_path, :priority => 0.7, :changefreq => "daily"

  Event.all.each do |event|
    add event_path(event), :lastmod => event.updated_at
  end
end
