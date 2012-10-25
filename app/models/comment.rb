# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates :content, :presence => true
  validates :user, :presence => true
end
