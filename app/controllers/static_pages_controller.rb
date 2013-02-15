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
end
