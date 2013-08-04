# == Schema Information
#
# Table name: events
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  slug             :string(255)
#  description      :text
#  venue_id         :integer
#  start_at         :datetime
#  end_at           :datetime
#  parent_id        :integer
#  logo             :string(255)
#  devcon_role      :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  summary          :text
#  schedule         :text
#  rules            :text
#  registration     :text
#  published        :boolean         default(FALSE)
#  event_type       :string(255)
#  target_attendees :integer
#  actual_attendees :integer
#  cover_photo      :string(255)
#

require 'spec_helper'

describe Event do
  before do
    @parent_event = Fabricate(:event)
    @event = Fabricate(:event, parent: @parent_event)
  end

  describe "#venues" do
    it "should return venues" do
      venues = @event.venues
      venues.should_not eq([])
    end

    it "should return venue of subevents as well" do
      venues = @parent_event.venues
      venues.should include(@event.venue)
    end
  end
end
