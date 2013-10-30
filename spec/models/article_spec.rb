# == Schema Information
#
# Table name: articles
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  content      :text
#  author_id    :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  slug         :string(255)
#  summary      :text
#  thumbnail    :string(255)
#  published    :boolean         default(FALSE)
#  published_at :datetime
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

  it { should validate_presence_of(:author_id) }
  it { should validate_presence_of(:content) }

  describe 'with blank title' do
    before { @article.title = ' ' }
    it { should_not be_valid }
  end
end
