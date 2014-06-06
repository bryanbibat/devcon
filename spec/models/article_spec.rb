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

describe Article, :type => :model do
  before do
    @author = Fabricate(:author)
    @article = @author.articles.build(:title => 'Hello World', :content => 'Lorem Ipsum')
  end

  subject { @article }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:author_id) }

  describe '#author' do
    subject { super().author }
    it { should == @author }
  end
  it { is_expected.to respond_to(:comments) }
  it { is_expected.to respond_to(:categories) }
  it { is_expected.to respond_to(:tags) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to validate_presence_of(:content) }

  describe 'with blank title' do
    before { @article.title = ' ' }
    it { is_expected.not_to be_valid }
  end
end
