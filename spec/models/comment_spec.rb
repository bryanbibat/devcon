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

describe Comment, :type => :model do
  before do
    @user = Fabricate(:user)
    @comment = Fabricate.build(:comment, :user => @user)
  end

  subject { @comment }

  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:commentable) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:user) }
  #it { should_not allow_mass_assignment_of(:user_id) }
  #it { should_not allow_mass_assignment_of(:commentable_id) }
  #it { should_not allow_mass_assignment_of(:commentable_type) }
end
