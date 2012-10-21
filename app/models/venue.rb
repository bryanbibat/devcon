class Venue < ActiveRecord::Base
  attr_accessible :address, :description, :latitude, :longitude, :name, :slug

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug

  before_validation :generate_slug

  def generate_slug
    self.slug ||= name.to_slug.normalize.to_s
  end

  def to_param
    slug
  end
end
