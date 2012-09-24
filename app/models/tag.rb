class Tag < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :articles

  validates :name, :presence => true
end
