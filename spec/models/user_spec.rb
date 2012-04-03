# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

require 'spec_helper'

describe User do
  before do
    @user = Fabricate(:user)
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:remember_me) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:sign_in_count) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:last_sign_in_ip) }

  it { should be_valid }

  describe 'when email is not present' do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when email format is invalid' do
    invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe 'when email format is valid' do
    valid_addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end

  describe 'when email address is already taken' do
    before do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email
      @user_with_same_email.save
    end

    subject { @user_with_same_email }

    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before { @user.password = @user.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe 'when password does not match confirmation' do
    before { @user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  describe 'when a password is too short' do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should be_invalid }
  end
end