class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :speaker
  attr_accessible :description, :name, :slide_link, :slug, :video_link
end
