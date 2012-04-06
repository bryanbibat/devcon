require 'spec_helper'

describe 'Articles pages' do

  subject { page }

  describe 'for anonymous users' do

    describe 'in the index page' do
      before { visit articles_path }

      it { should have_selector('title', :text => full_title('Articles')) }
      it { should_not have_link('Post article') }
    end
  end

  describe 'for signed-in users' do

    let(:user) { Fabricate(:user) }
    before do
      visit new_user_session_path
      capybara_signin(user)
    end

    describe 'in the index page' do
      before { visit articles_path }

      it { should have_selector('title', :text => full_title('Articles')) }
      it { should have_selector('h1', :text => 'Articles') }
      it { should have_link('Post article') }

      describe 'when user has a self-authored article' do
        let(:article) { Fabricate(:article, :author_id => user.id) }
        before { visit articles_path }
        it { should have_link('Edit article', :href => edit_article_path(article)) }
      end
    end

    describe 'in the show page' do
      let(:article) { Fabricate(:article, :author_id => user.id) }
      before { visit article_path(article) }

      describe 'when user is the author' do
        it { should have_link('Edit article', :href => edit_article_path(article)) }
      end

      describe 'when user is not the author' do
        let(:other_user) { Fabricate(:user) }
        before do
          click_link 'Sign out'
          visit new_user_session_path
          capybara_signin(other_user)
          visit article_path(article)
        end
         
        it { should_not have_link('Edit article', :href => edit_article_path(article)) }
      end
    end

    describe 'on article creation' do
      before { visit new_article_path }

      it { should have_selector('title', :text => full_title('Create an article')) }
      it { should have_selector('h1', :text => 'Create an article') }

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

    describe 'on editing articles' do
      let(:article) { Fabricate(:article, :author_id => user.id) }
      before { visit edit_article_path(article) }

      it { should have_selector('title', :text => full_title('Edit article')) }
      it { should have_selector('h1', :text => 'Edit article') }

      describe 'with invalid information' do

        before do
          fill_in 'Title', :with => ' '
          fill_in 'Content', :with => ' '
          click_button 'Update'
        end

        it { should have_content('error') }
      end

      describe 'with valid information' do

        before do
          fill_in 'Content', :with => 'foobar'
          click_button 'Update'
        end

        it { should have_content('updated') }
      end
    end
  end
end
