class Event < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :description, :description, :devcon_role, :end_at, :logo, :name, :parent_id, :slug, :start_at
end
