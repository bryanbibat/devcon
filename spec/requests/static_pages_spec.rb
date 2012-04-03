require 'spec_helper'

describe 'Static pages' do

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector('h1', :text => heading) }
    it { should have_selector('title', :text => full_title(page_title)) }
  end

  describe 'Home page' do
    before { visit root_path }
    let(:heading)    { 'Developers Connect' }
    let(:page_title) { '' }

    it_should_behave_like 'all static pages'
    it { should_not have_selector('title', :text => 'Home -') }
  end

  describe 'Contact page' do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like 'all static pages'
  end

  describe 'About page' do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like 'all static pages'
  end

  it 'should have the right links on the layout' do
    visit root_path
    click_link 'About'
    page.should have_selector('title', :text => full_title('About'))
    click_link 'Contact'
    page.should have_selector('title', :text => full_title('Contact'))
    click_link 'Home'
    page.should have_selector('title', :text => full_title(''))
    click_link 'Sign up'
    page.should have_selector('title', :text => full_title('Sign up'))
    click_link 'Sign in'
    page.should have_selector('title', :text => full_title('Sign in'))
  end
end