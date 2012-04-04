require 'spec_helper'

describe Article do

  let(:user) { Fabricate(:user) }
  before do
    @article = user.articles.build(:title => 'Hello World', :content => 'Lorem Ipsum')
  end

  subject { @article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:author_id) }
  its(:author) { should == user }

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
        Article.new(:author_id => user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end