# == Schema Information
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Article < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

  validates :title, :presence => true
  validates :content, :presence => true
  validates :author_id, :presence => true

  default_scope :order => 'articles.created_at DESC'
end
