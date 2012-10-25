# == Schema Information
#
# Table name: venues
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  address     :text
#  latitude    :decimal(15, 12)
#  longitude   :decimal(15, 12)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Venue do
  pending "add some examples to (or delete) #{__FILE__}"
end
