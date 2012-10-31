module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then   'alert alert-info'
    when :success then  'alert alert-success'
    when :error then    'alert alert-error'
    when :alert then    'alert alert-error'
    end
  end

  def logo
    image_tag('devcon_logo.png', :alt => 'Developers Connect')
  end

  def full_title(page_title)
    base_title = ENV['title']
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def generate_description(text) 
    text.tr("\n"," ").gsub(/\s+/, " ").strip
  end

  def thumbnail_url(obj)
    request.protocol + request.host_with_port + (obj.thumbnail.opengraph.blank? ? asset_path("devcon_logo_opengraph.png") : obj.thumbnail.opengraph.url)
  end
end
