require 'spec_helper'

describe Category do

  before do
    @category = Fabricate(:category)
  end

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe 'when name is blank' do
    before { @category.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when description is blank' do
    before { @category.description = ' ' }
    it { should be_valid }
  end
end
