# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  slug        :string(255)
#

require 'spec_helper'

describe Category, :type => :model do

  before do
    @category = Fabricate(:category)
  end

  subject { @category }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.not_to validate_presence_of(:description) }
end
