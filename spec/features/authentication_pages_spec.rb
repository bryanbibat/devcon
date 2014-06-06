require 'spec_helper'

describe 'Authentication', :type => :feature do

  subject { page }

  describe 'signin page' do

    before { visit new_user_session_path }

    it { is_expected.to have_page_title 'Sign in' }
    it { is_expected.to have_page_heading 'Sign in' }
  end

  describe 'signin' do

    before { visit new_user_session_path }

    it { is_expected.to have_page_title 'Sign in' }
    it { is_expected.to have_page_heading 'Sign in' }

    describe 'with invalid information' do

      before { click_button 'Sign in' }

      it { is_expected.to have_error_message 'Invalid' }

      describe 'after visiting another page' do

        before { click_link 'Home' }

        it { is_expected.not_to have_selector 'div.alert.alert-error' }
      end
    end

    describe 'with valid information' do

      before do
        @user = Fabricate(:user)
        capybara_signin(@user)
      end

      it { is_expected.to have_page_title '' }

      it { is_expected.to have_link 'Profile', :href => user_path(@user) }
      it { is_expected.to have_link 'Settings', :href => settings_path }
      it { is_expected.to have_link 'Sign out', :href => logout_path }
      it { is_expected.not_to have_link 'Sign in', :href => login_path }

      describe 'followed by signout' do

        before { click_link 'Sign out' }

        it { is_expected.to have_link 'Sign in' }
      end
    end
  end

  describe 'authorization' do

    describe 'as wrong user' do

      before do
        @user = Fabricate(:user)
        @wrong_user = Fabricate(:user, :email => 'wrong@example.com')
        visit new_user_session_path
        capybara_signin(@user)
      end

      describe 'when visiting Settings page' do

        before { visit edit_user_registration_path(@wrong_user) }

        it { is_expected.not_to have_page_title 'Account settings' }
      end
    end

  end
end
