require 'spec_helper'

describe Authentication, :type => :model do
  before do
    @provider = Fabricate(:authentication)
  end

  subject { @provider }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:provider) }
  it { is_expected.to respond_to(:uid) }

  it { is_expected.to belong_to(:user) }

  describe "#find_by_provider_and_uid" do
    context "user has already registered with OAuth" do
      before do
        @user = Fabricate(:user)
        @authentication = Fabricate(:authentication, user: @user)
        @provider = @user.authentications.first.provider
        @uid = @user.authentications.first.uid
      end

      it "should return a user when provided the proper arguments" do
        expect(Authentication.find_by_provider_and_uid(@provider, @uid)).to eq(@authentication)
      end

      it "should return an authentication record that belongs to the proper user" do
        authentication = Authentication.find_by_provider_and_uid(@provider, @uid)
        expect(authentication.user).to eq(@user)
      end
    end

    context "with invalid provider and uid" do
      it "should not return anything" do
        expect(Authentication.find_by_provider_and_uid("foo", "bar")).to eq(nil)
      end
    end
  end
end
