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

    Event.all.each do |event_temp|
      url = event_url(event_temp)
      cal.event do
        dtstart     event_temp.start_at.strftime("%Y%m%dT%H%M00")
        dtend       event_temp.end_at.strftime("%Y%m%dT%H%M00")
        summary     event_temp.name
        description event_temp.summary
        klass       'PRIVATE'
        url         url

        alarm do
          action  'DISPLAY'
          summary 'Event notification'
          trigger '-P1DT0H0M0S'
        end
      end
    end
    send_data cal.to_ical, filename: "calendar.ics", type: 'text/calendar', x_sendfile: true
  end
end
