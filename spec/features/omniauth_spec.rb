require 'spec_helper'

feature 'Omniauth' do

    context "facebook login" do
        background do
            @user = Fabricate(:user)
            omniauth_mock('facebook', @user.email, @user.name)
        end

        scenario "sign in a user" do
            visit root_path
            click_link 'Sign in'
            find(:xpath, "//a/img[@alt='Fblogin']/..").click

            expect(page).to have_content(I18n.t "devise.omniauth_callbacks.success", :kind => 'facebook')
        end

        scenario "register a new user" do
            omniauth_mock('facebook', '', '')
            visit root_path
            click_link 'Sign in'
            find(:xpath, "//a/img[@alt='Fblogin']/..").click

            expect(page).to have_content('Registrations are not open yet, but please check back soon')
        end
    end

end
