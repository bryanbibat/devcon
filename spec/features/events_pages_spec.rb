require 'spec_helper'

describe 'Events pages', :type => :feature do

  subject { page }

  describe 'for anonymous users' do
    describe 'in the show page' do

      before do
        @event = Fabricate(:event)
        @event.save
        visit event_path(@event)
      end

      it { is_expected.to have_page_title @event.name }
      it { is_expected.not_to have_link 'Edit' }

    end

    describe 'in the map page' do

      before do
        @event = Fabricate(:event)
        @event.save
        visit map_events_path(@event)
      end

      it { is_expected.to have_page_title "Events Map" }

    end
  end
end
