# == Schema Information
#
# Table name: event_partners
#
#  id           :integer         not null, primary key
#  event_id     :integer
#  entity_id    :integer
#  role         :string(255)
#  custom_blurb :text
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class EventPartner < ActiveRecord::Base
  attr_accessible :custom_blurb, :entity_id, :role
  validates_presence_of :entity_id, :event_id, :role
  validates_uniqueness_of :entity_id, :scope => :event_id

  belongs_to :event
  belongs_to :entity
end
