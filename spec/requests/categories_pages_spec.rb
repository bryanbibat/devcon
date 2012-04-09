require 'spec_helper'

describe "Categories pages" do

  subject { page }

  describe 'for anonymous users' do

    describe 'in the index page' do
      before { visit categories_path }

      it { should have_selector('title', :text => full_title('Categories')) }
    end
  end

  describe 'for signed-in users' do

    before do
      @user = Fabricate(:user)
      visit new_user_session_path
      capybara_signin(@user)
    end

    describe 'in the index page' do
      before do
        @category = Fabricate(:category)
        visit categories_path
      end

      it { should have_selector('title', :text => full_title('Categories')) }
      it { should have_selector('h1', :text => 'Categories') }
      it { should have_link('New Category', :href => new_category_path) }
      it { should have_link('Edit', :href => edit_category_path(@category)) }
      it { should have_link('Delete', :href => category_path(@category), :method => :delete) }
    end

    describe 'in the show page' do

      before do
        @category = Fabricate(:category)
        visit category_path(@category)
      end

      it { should have_selector('title', :text => @category.name) }
      it { should have_selector('h1', :text => @category.name) }
      it { should have_link('Edit category', :href => edit_category_path(@category)) }
      it { should have_link('Delete category', :href => category_path(@category), :method => :delete) }

      it { should have_selector('h2', :text => "Articles under #{@category.name}") }
      it 'should have a list of articles under it'
      # it { should have_link(@category.articles.find(1).title :href => article_path(@category.articles.find(1))) }
      # @category.articles.each do |article|
      #   it { should have_link(article.title, :href => article_path(article)) }
      # end
    end

    describe 'on category creation' do
      before { visit new_category_path }

      it { should have_selector('title', :text => full_title('Create a category')) }
      it { should have_selector('h1', :text => 'Create a category') }

      describe 'with invalid information' do

        it 'should not create a category' do
          expect { click_button 'Create' }.should_not change(Category, :count)
        end

        describe 'error messages' do
          before { click_button 'Create' }
          it { should have_content('error') }
        end
      end

      describe 'with valid information' do

        before do
          fill_in 'Name', :with => 'Uncategorized'
          fill_in 'Description', :with => 'Default category'
        end

        it 'should create a category' do
          expect { click_button 'Create' }.should change(Category, :count).by(1)
        end
      end
    end

    describe 'on editing categories' do

      before do
        @category = Fabricate(:category)
        visit edit_category_path(@category)
      end

      it { should have_selector('title', :text => full_title('Edit category')) }
      it { should have_selector('h1', :text => 'Edit category') }

      describe 'with invalid information' do

        before do
          fill_in 'Name', :with => ' '
          fill_in 'Description', :with => ' '
          click_button 'Update'
        end

        it { should have_content('error') }
      end

      describe 'with valid information' do

        before do
          fill_in 'Description', :with => 'barfoo'
          click_button 'Update'
        end

        it { should have_content('updated') }
      end
    end
  end
end
