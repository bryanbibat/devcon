require 'spec_helper'

describe EventsController, :type => :controller do

  describe "GET 'previous'" do
    it "returns http success" do
      get 'previous'
      expect(response).to be_success
    end
  end

  describe "GET 'event ics'" do
    it "returns http success" do
      event = Fabricate(:event)
      event.save
      get 'ics', :id => event.slug
      expect(response).to be_success
    end
  end
end
