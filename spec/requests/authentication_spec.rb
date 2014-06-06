require 'spec_helper'

describe 'Authentication', :type => :request do

  subject { page }

  describe 'authorization' do

    describe 'for non-signed in users' do

      before do
        @author = Fabricate(:author)
      end

      describe 'in the Articles controller' do

        describe 'when submitting to the create action' do

          before { post articles_path }

          specify { expect(response).to redirect_to(root_path) }
        end

        describe 'when submitting to the update action' do

          before do
            @article = Fabricate(:article, :author => @author)
            put article_path(@article)
          end

          specify { expect(response).to redirect_to(root_path) }
        end

        describe 'when submitting to the destroy action' do

          before do
            @article = Fabricate(:article, :author => @author)
            delete article_path(@article)
          end

          specify { expect(response).to redirect_to(root_path) }
        end
      end

      describe 'in the Categories controller' do

        describe 'when submitting to the create action' do

          before { post categories_path }

          specify { expect(response).to redirect_to(root_path) }
        end

        describe 'when submitting to the update action' do

          before do
            @category = Fabricate(:category)
            put category_path(@category)
          end

          specify { expect(response).to redirect_to(root_path) }
        end

        describe 'when submitting to the destroy action' do

          before do
            @category = Fabricate(:category)
            delete category_path(@category)
          end

          specify { expect(response).to redirect_to(root_path) }
        end
      end

      describe 'in the Comments controller' do

        describe 'when submitting to the create action' do

          before do
            @article = Fabricate(:article)
            post article_comments_path @article
          end

          specify { expect(response).to redirect_to(new_user_session_path) }
        end
      end
    end
  end
end
