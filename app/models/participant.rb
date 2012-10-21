class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :entity
  attr_accessible :role
end
