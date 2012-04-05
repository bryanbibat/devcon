require 'spec_helper'

describe 'Articles pages' do

  subject { page }

  describe 'for anonymous users' do

    describe 'in the index page' do
      before { visit articles_path }

      it { should have_selector('title', :text => full_title('Articles')) }
    end
  end

  describe 'for signed-in users' do

    let(:user) { Fabricate(:user) }
    before do
      visit new_user_session_path
      capybara_signin(user)
    end

    describe 'on article creation' do
      before { visit new_article_path }

      describe 'with invalid information' do

        it 'should not create an article' do
          expect { click_button 'Post' }.should_not change(Article, :count)
        end

        describe 'error messages' do
          before { click_button 'Post' }
          it { should have_content('error') }
        end
      end

      describe 'with valid information' do

        before do
          fill_in 'Title', :with => 'Hello World'
          fill_in 'Content', :with => 'Lorem ipsum'
        end

        it 'should create an article' do
          expect { click_button 'Post' }.should change(Article, :count).by(1)
        end
      end
    end
  end
end
