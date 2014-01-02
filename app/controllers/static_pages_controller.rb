class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def feed
    @title = "Developers Connect Philippines"
    @entries = 
      (Event.include_subevents.all + Article.all)
      .sort_by(&:updated_at).reverse
    @updated = unless @entries.empty?
      @entries.first.updated_at
    else
      DateTime.now
    end
    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def calendar
    cal = Icalendar::Calendar.new
    cal.custom_property("X-WR-CALNAME", "DevCon Calendar of Events")
    cal.custom_property("X-WR-TIMEZONE", "Asia/Manila")

    Event.all.each do |event_temp|
      url = event_url(event_temp)
      cal.event do
        dtstart     event_temp.start_at.strftime("%Y%m%dT%H%M00")
        dtend       event_temp.end_at.strftime("%Y%m%dT%H%M00")
        dtstamp     event_temp.updated_at.strftime("%Y%m%dT%H%M00")
        uid         "#{event_temp.slug}@devcon.ph"
        summary     event_temp.name
        description event_temp.summary
        klass       'PUBLIC'
        url         url
      end
    end
    send_data cal.to_ical, filename: "calendar.ics", type: 'text/calendar', x_sendfile: true
  end
end
