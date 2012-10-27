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
#  formal_name :string(255)
#  short_name  :string(255)
#

class Entity < ActiveRecord::Base
  attr_accessible :blurb, :description, :level, :logo, :name, :slug, :type, :formal_name, :short_name

  include SluggedResource

  TYPES = %w{ school company community }
  LEVELS = %w{ cool awesome }

  validates_presence_of :type
  def self.inheritance_column
    "disabled"
  end

  validates_inclusion_of :type, :in => TYPES
  validates_inclusion_of :level, :in => LEVELS, :allow_blank => true

  mount_uploader :logo, LogoUploader
end
