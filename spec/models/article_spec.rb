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

require 'spec_helper'

describe Article do
  before do
    @author = Fabricate(:author)
    @article = @author.articles.build(:title => 'Hello World', :content => 'Lorem Ipsum')
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:author_id) }
  its(:author) { should == @author }
  it { should respond_to(:comments) }
  it { should respond_to(:categories) }
  it { should respond_to(:tags) }

  it { should be_valid }

  describe 'when author_id is not present' do
    before { @article.author_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank title' do
    before { @article.title = ' ' }
    it { should_not be_valid }
  end

  describe 'with blank content' do
    before { @article.content = ' ' }
    it { should_not be_valid }
  end

  describe 'accessible attributes' do
    it 'should not allow access to author_id' do
      expect do
        Article.new(:author_id => @author.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
