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

require 'spec_helper'

describe Participant, :type => :model do
end
