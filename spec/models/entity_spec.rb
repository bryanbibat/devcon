# == Schema Information
#
# Table name: entities
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  description :text
#  blurb       :text
#  logo        :string(255)
#  type        :string(255)
#  level       :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  formal_name :string(255)
#  short_name  :string(255)
#  display     :boolean         default(FALSE)
#

require 'spec_helper'

describe Entity do
  before { @entity = Fabricate.build(:entity) }
  subject { @entity }

  it { should validate_presence_of(:type) }
  it { should ensure_inclusion_of(:type).in_array(["school", "company", "community"]) }
  it { should ensure_inclusion_of(:level).in_array(["cool", "awesome"]) }

  it { should have_many(:event_partners) }
  it { should have_many(:events).through(:event_partners) }

  describe "#inheritance_column" do
    it "must disable STI to use 'type' as a column name" do
      Entity.inheritance_column.should eq("disabled")
    end
  end
end
