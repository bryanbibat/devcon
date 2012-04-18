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
