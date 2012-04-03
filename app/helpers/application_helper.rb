module ApplicationHelper

  def logo
    image_tag('devcon_logo.png', :alt => 'Developers Connect')
  end

  def full_title(page_title)
    base_title = 'Developers Connect'
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end
end