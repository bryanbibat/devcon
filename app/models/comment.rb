class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates :content, :presence => true
end
