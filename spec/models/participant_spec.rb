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

require 'spec_helper'

describe Participant do
  pending "add some examples to (or delete) #{__FILE__}"
end
