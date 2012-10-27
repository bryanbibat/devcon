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

class Entity < ActiveRecord::Base
  attr_accessible :blurb, :description, :level, :logo, :name, :slug, :type

  include SluggedResource

  TYPES = %w{ school company user-group }
  LEVELS = %w{ cool awesome }

  validates_presence_of :type

  validates_inclusion_of :type, :in => TYPES
  validates_inclusion_of :levels, :in => LEVELS, :allow_blank => true
end
