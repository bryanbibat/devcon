# == Schema Information
#
# Table name: entities
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  description :text
#  blurb       :text
#  logo        :string(255)
#  type        :string(255)
#  level       :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Entity do
  pending "add some examples to (or delete) #{__FILE__}"
end
