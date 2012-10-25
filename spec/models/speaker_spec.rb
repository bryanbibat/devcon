# == Schema Information
#
# Table name: speakers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Speaker do
  pending "add some examples to (or delete) #{__FILE__}"
end
