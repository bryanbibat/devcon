# == Schema Information
#
# Table name: resource_people
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  description :text
#  main_title  :string(255)
#  thumbnail   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class ResourcePerson < ActiveRecord::Base
  attr_accessible :description, :main_title, :thumbnail, :name, :description

  include SluggedResource

  mount_uploader :thumbnail, ThumbnailUploader
end
