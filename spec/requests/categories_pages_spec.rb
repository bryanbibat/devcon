require 'spec_helper'

describe "Categories pages" do

  subject { page }

  describe 'for anonymous users' do

    describe 'in the index page' do

      before { visit categories_path }

      it { should have_page_title 'Categories' }
      it { should have_page_heading 'Categories' }
    end
  end

  describe 'for signed-in users' do

    describe 'as a regular user' do

      before do
        @user = Fabricate(:user)
        visit new_user_session_path
        capybara_signin(@user)
      end

      describe 'in the index page' do

        before { visit categories_path }

        it { should have_page_title 'Categories' }
        it { should have_page_heading 'Categories' }
        it { should_not have_link 'New Category' }
        it { should_not have_link 'Edit' }
        it { should_not have_link 'Destroy' }
      end

      describe 'in the show page' do

        before do
          @category = Fabricate(:category)
          visit category_path(@category)
        end

        it { should have_page_title @category.name }
        it { should have_page_heading @category.name }
        it { should have_content @category.description }
        it { should_not have_link 'Edit' }
        it { should_not have_link 'Destroy' }

        it { should have_selector('h2', :text => "Articles under #{@category.name}") }
        it 'should have a list of articles under it'
        # it { should have_link(@category.articles.find(1).title :href => article_path(@category.articles.find(1))) }
        # @category.articles.each do |article|
        #   it { should have_link(article.title, :href => article_path(article)) }
        # end
      end

      describe 'in the new page' do

        before { visit new_category_path }

        it { should have_error_message 'Access denied' }
        it { should have_page_title '' }
        it { should have_page_heading 'Developers Connect' }
      end

      describe 'in the edit page' do

        before do
          @category = Fabricate(:category)
          visit edit_category_path(@category)
        end

        it { should have_error_message 'Access denied' }
        it { should have_page_title '' }
        it { should have_page_heading 'Developers Connect' }
      end
    end

    describe 'as an author' do

      before do
        @author = Fabricate(:author)
        visit new_user_session_path
        capybara_signin(@author)
      end

      describe 'in the index page' do

        before { visit categories_path }

        it { should have_page_title 'Categories' }
        it { should have_page_heading 'Categories' }
        it { should have_link 'New category' }

        describe 'with a list of categories' do

          before do
            @category = Fabricate(:category)
            visit categories_path
          end

          it { should have_link @category.name }
          it { should have_link 'Edit' }
          it { should_not have_link 'Destroy' }
        end
      end

      describe 'in the show page' do

        before do
          @category = Fabricate(:category)
          visit category_path(@category)
        end

        it { should have_page_title @category.name }
        it { should have_page_heading @category.name  }
        it { should have_link 'Back to categories' }
        it { should have_link 'Edit' }
        it { should_not have_link 'Destroy' }
      end

      describe 'in the new page' do

        before { visit new_category_path }

        it { should have_page_title 'New category' }
        it { should have_page_heading 'New category' }
        it { should have_link 'Back to categories' }

        describe 'with invalid information' do

          it 'should not create a category' do

            expect { click_button 'Create' }.should_not change(Category, :count)
          end

          describe 'on error messages' do

            before { click_button 'Create' }

            it { should have_error_message 'error' }
          end
        end

        describe 'with valid information' do

          before do
            fill_in 'Name', :with => 'Foobar'
            fill_in 'Description', :with => 'A foo walks into a bar'
          end

          it 'should create a category' do

            expect { click_button 'Create' }.should change(Category, :count).by(1)
          end

          describe 'on success messages' do

            before { click_button 'Create' }

            it { should have_success_message 'created' }
          end
        end
      end

      describe 'in the edit page' do

        before do
          @category = Fabricate(:category)
          visit edit_category_path(@category)
        end

        it { should have_page_title 'Edit category' }
        it { should have_page_heading 'Edit category' }
        it { should have_link 'Back to categories' }

        describe 'with invalid information' do

          before do
            fill_in 'Name', :with => ' '
            click_button 'Update'
          end

          it { should have_error_message 'error' }
        end

        describe 'with valid information' do

          before do
            fill_in 'Name', :with => 'barfoo'
            click_button 'Update'
          end

          it { should have_success_message 'updated' }
        end
      end

      describe 'on destroying categories' do

        it 'should destroy the category' do
          pending 'check that the number of categories has decreased'
          expect { delete category_path(@category) }.should change(Category, :count).by(-1)
        end

        describe 'on notice messages' do

          it 'should have an error message' do
            pending 'check for an error message when destroying'
            before { delete category_path(@category) }

            it { should have_notice_message 'destroyed' }
          end
        end
      end
    end
  end
end
