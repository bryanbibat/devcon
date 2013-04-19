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

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user) }
  it { should_not allow_mass_assignment_of(:user_id) }
  it { should_not allow_mass_assignment_of(:commentable_id) }
  it { should_not allow_mass_assignment_of(:commentable_type) }
end
