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

describe Entity, :type => :model do
  before { @entity = Fabricate.build(:entity) }
  subject { @entity }

  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_inclusion_of(:type).in_array(["school", "company", "community"]) }
  it { is_expected.to validate_inclusion_of(:level).in_array(["cool", "awesome"]) }

  it { is_expected.to have_many(:event_partners) }
  it { is_expected.to have_many(:events).through(:event_partners) }

  describe "#inheritance_column" do
    it "must disable STI to use 'type' as a column name" do
      expect(Entity.inheritance_column).to eq("disabled")
    end
  end
end
