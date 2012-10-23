class Venue < ActiveRecord::Base
  attr_accessible :address, :description, :latitude, :longitude, :name, :slug

  include SluggedResource
end
