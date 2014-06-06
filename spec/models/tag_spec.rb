# == Schema Information
#
# Table name: tags
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Tag, :type => :model do

  before do
    @tag = Fabricate(:tag)
  end

  subject { @tag }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.not_to validate_presence_of(:description) }
end
