require 'spec_helper'

describe 'Authentication' do

  subject { page }

  describe 'signin page' do
    before { visit new_user_session_path }

    it { should have_selector('h1', :text => 'Sign in') }
    it { should have_selector('title', :text => full_title('Sign in')) }
  end

  describe 'signin' do
    before { visit new_user_session_path }

    describe 'with invalid information' do
      before { click_button 'Sign in' }

      it { should have_selector('title', :text => 'Sign in') }
      it { should have_error_message('Invalid') }

      describe 'after visiting another page' do
        before { click_link 'Home' }

        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe 'with valid information' do
      let(:user) { Fabricate(:user) }
      before { capybara_signin(user) }

      it { should have_selector('title', :text => full_title('')) }

      it { should have_link('Profile', :href => user_path(user)) }
      it { should have_link('Settings', :href => edit_user_registration_path) }
      it { should have_link('Sign out', :href => destroy_user_session_path) }
      it { should_not have_link('Sign in', :href => new_user_session_path) }

      describe 'followed by signout' do
        before { click_link 'Sign out' }

        it { should have_link('Sign in') }
      end
    end
  end

  describe 'authorization' do

    describe 'as wrong user' do
      let(:user) { Fabricate(:user) }
      let(:wrong_user) { Fabricate(:user, :email => 'wrong@example.com') }
      before do
        visit new_user_session_path
        capybara_signin user
      end

      describe 'when visiting Settings page' do
        before { visit edit_user_registration_path(wrong_user) }
        it { should_not have_selector('title', :text => full_title('Account settings')) }
      end
    end
  end
end