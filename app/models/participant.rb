# == Schema Information
#
# Table name: participants
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  entity_id  :integer
#  role       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :entity
  attr_accessible :role
end
