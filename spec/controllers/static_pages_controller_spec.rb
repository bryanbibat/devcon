require 'spec_helper'

describe StaticPagesController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end

    it "checks for events" do
      get 'home'
      expect(assigns(:events_type)).to eq("No Events Yet")
    end

    it "shows previous events" do
      prev = Fabricate(:event, :start_at => 5.hours.ago, :end_at => 4.hours.ago)
      get 'home'
      expect(assigns(:events_type)).to eq("Previous Events")
      expect(assigns(:events)).to eq([prev])
    end

    it "shows upcoming events" do
      Fabricate(:event, :start_at => 5.hours.ago, :end_at => 4.hours.ago)
      upcoming = Fabricate(:event, :start_at => 4.hours.from_now, :end_at => 5.hours.from_now)
      get 'home'
      expect(assigns(:events_type)).to eq("Upcoming Events")
      expect(assigns(:events)).to eq([upcoming])
    end
  end

  describe "GET 'feed'" do
    it "returns http success" do
      get 'feed', :format => :atom
      expect(response).to be_success
    end

    it "returns http redirect for rss" do
      get 'feed', :format => :rss
      expect(response).to be_redirect
    end

    it "is successful when there are events" do
      Fabricate(:event)
      get 'feed', :format => :atom
      expect(response).to be_success
    end

    it "is successful when there are articles" do
      Fabricate(:article)
      get 'feed', :format => :atom
      expect(response).to be_success
    end
  end

  describe "GET 'calendar'" do
    it "returns http success" do
      get 'calendar'
      expect(response).to be_success
    end

    it "is successful when there are events" do
      Fabricate(:event)
      get 'calendar'
      expect(response).to be_success
    end
  end
end
