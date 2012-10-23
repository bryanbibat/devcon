class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :subevents, :class_name => "Event", :foreign_key => :parent_id
  belongs_to :parent, :class_name => "Event"
  attr_accessible :description, :description, :devcon_role, :end_at, :logo, :name, :parent_id, :slug, :start_at, :venue_id

  include SluggedResource
end
