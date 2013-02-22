# == Schema Information
#
# Table name: events
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  slug             :string(255)
#  description      :text
#  venue_id         :integer
#  start_at         :datetime
#  end_at           :datetime
#  parent_id        :integer
#  logo             :string(255)
#  devcon_role      :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  summary          :text
#  schedule         :text
#  rules            :text
#  registration     :text
#  published        :boolean         default(FALSE)
#  event_type       :string(255)
#  target_attendees :integer
#  actual_attendees :integer
#

class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :subevents, :class_name => "Event", :foreign_key => :parent_id, :order => :start_at
  belongs_to :parent, :class_name => "Event"
  has_many :event_partners
  has_many :entities, :through => :event_partners
  has_many :participants
  has_many :resource_people, :through => :participants

  attr_accessible :description, :description, :devcon_role, :end_at, :logo, :name, :parent_id, :slug, :start_at, :venue_id, :summary, :schedule, :rules, :registration
  attr_accessible :event_type, :target_attendees, :actual_attendees

  include SluggedResource

  mount_uploader :logo, ThumbnailUploader

  scope :upcoming, where("start_at > current_timestamp").order("start_at")
  scope :current, where("start_at <= current_timestamp and end_at >= current_timestamp").order("start_at")
  scope :finished, where("end_at < current_timestamp").order("end_at DESC")
  scope :include_subevents, where(:parent_id => nil).includes(:subevents)

  def venues
    ([venue] + subevents.map { |e| e.venue }).compact
  end

  def self.previous_by_month
    finished.include_subevents.group_by do |event|
      event.start_at.strftime("%B %Y")
    end
  end
end
