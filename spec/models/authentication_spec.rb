require 'spec_helper'

describe Authentication do
  before do
    @provider = Fabricate(:authentication)
  end

  subject { @provider }

  it { should be_valid }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }

  it { should belong_to(:user) }

  describe "#find_by_provider_and_uid" do
    context "user has already registered with OAuth" do
      before do
        @user = Fabricate(:user)
        @authentication = Fabricate(:authentication, user: @user)
        @provider = @user.authentications.first.provider
        @uid = @user.authentications.first.uid
      end

      it "should return a user when provided the proper arguments" do
        Authentication.find_by_provider_and_uid(@provider, @uid).should eq(@authentication)
      end

      it "should return an authentication record that belongs to the proper user" do
        authentication = Authentication.find_by_provider_and_uid(@provider, @uid)
        authentication.user.should eq(@user)
      end
    end

    context "with invalid provider and uid" do
      it "should not return anything" do
        Authentication.find_by_provider_and_uid("foo", "bar").should eq(nil)
      end
    end
  end
end
