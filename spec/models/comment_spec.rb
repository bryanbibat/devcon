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

require 'spec_helper'

describe Comment do
  before do
    @user = Fabricate(:user)
    @comment = Fabricate.build(:comment, :user => @user)
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user) }
  it { should respond_to(:commentable) }

  it { should be_valid }

  describe 'with blank content' do
    before { @comment.content = ' ' }
    it { should_not be_valid }
  end

  describe 'with no user' do
    before { @comment.user = nil }
    it { should_not be_valid }
  end

  describe 'accessible attributes' do
    it 'should not allow access to user_id' do
      expect do
        Comment.new(:user_id => @user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it 'should not allow access to commentable_id' do
      expect do
        Comment.new(:commentable_id => 1)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it 'should not allow access to commentable_type' do
      expect do
        Comment.new(:commentable_type => 'Something')
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
