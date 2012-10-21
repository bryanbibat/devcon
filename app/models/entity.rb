class Entity < ActiveRecord::Base
  attr_accessible :blurb, :description, :level, :logo, :name, :slug, :type
end
