require 'spec_helper'

describe EventPartner, :type => :model do
end
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

