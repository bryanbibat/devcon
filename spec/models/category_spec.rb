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

describe Category do

  before do
    @category = Fabricate(:category)
  end

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should_not validate_presence_of(:description) }
end
