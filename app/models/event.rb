# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  description :text
#  venue_id    :integer
#  start_at    :datetime
#  end_at      :datetime
#  parent_id   :integer
#  logo        :string(255)
#  devcon_role :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :subevents, :class_name => "Event", :foreign_key => :parent_id
  belongs_to :parent, :class_name => "Event"
  attr_accessible :description, :description, :devcon_role, :end_at, :logo, :name, :parent_id, :slug, :start_at, :venue_id

  include SluggedResource
end
