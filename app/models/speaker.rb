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

class Speaker < ActiveRecord::Base
  include SluggedResource
end
