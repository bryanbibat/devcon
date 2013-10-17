# == Schema Information
#
# Table name: participants
#
#  id                 :integer         not null, primary key
#  event_id           :integer
#  resource_person_id :integer
#  role               :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  custom_description :text
#  custom_title       :string(255)
#

class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :resource_person

  validates_presence_of :event_id, :resource_person_id, :role
  validates_uniqueness_of :resource_person_id, :scope => :event_id
end
