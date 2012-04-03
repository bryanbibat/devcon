require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe 'signup page' do
    before { visit new_user_registration_path }

    it { should have_selector('h1', :text => 'Sign up') }
    it { should have_selector('title', :text => full_title('Sign up')) }
  end

  describe 'signup' do

    before { visit new_user_registration_path }

    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button 'Sign up' }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'foobar'
        fill_in 'Password confirmation', :with => 'foobar'
      end

      it 'should create a user' do
        expect { click_button 'Sign up' }.to change(User, :count).by(1)
      end

      describe 'after saving the user' do
        before { click_button 'Sign up' }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('div.alert.alert-info', :text => 'Welcome!') }
        it { should have_link(user.email) }
        it { should have_link('Settings') }
        it { should have_link('Sign out') }
        it { should_not have_link('Sign up')}
        it { should_not have_link('Sign in') }
      end
    end
  end
end