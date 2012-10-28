# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  slug        :string(255)
#

class Category < ActiveRecord::Base
  attr_accessible :description, :name, :slug
  has_and_belongs_to_many :articles

  include SluggedResource
end
