# == Schema Information
#
# Table name: events
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  slug         :string(255)
#  description  :text
#  venue_id     :integer
#  start_at     :datetime
#  end_at       :datetime
#  parent_id    :integer
#  logo         :string(255)
#  devcon_role  :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  summary      :text
#  schedule     :text
#  rules        :text
#  registration :text
#  published    :boolean         default(FALSE)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
