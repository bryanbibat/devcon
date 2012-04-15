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
  attr_accessible :title, :content, :category_ids
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_and_belongs_to_many :categories
  has_many :comments, :as => :commentable

  validates :title, :presence => true
  validates :content, :presence => true
  validates :author_id, :presence => true

  default_scope :order => 'articles.created_at DESC'
end
