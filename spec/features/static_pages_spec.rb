require 'spec_helper'

describe 'Static pages', :type => :feature do

  subject { page }

  shared_examples_for 'all static pages' do
    it { is_expected.to have_page_title page_title }
  end

  describe 'Home page' do
    before { visit root_path }
    let(:heading)    { 'Developers Connect' }
    let(:page_title) { '' }

    it_should_behave_like 'all static pages'
    it { is_expected.not_to have_page_title 'Home -' }
  end

  describe 'Contact page' do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like 'all static pages'
  end

  describe 'FAQ page' do
    before { visit faq_path }
    let(:heading)    { 'Frequently Asked Questions' }
    let(:page_title) { 'Frequently Asked Questions' }

    it_should_behave_like 'all static pages'
  end

  it 'should have the right links on the layout' do
    visit root_path
    click_link 'Contact'
    expect(page).to have_page_title 'Contact'
    click_link 'Home'
    expect(page).to have_page_title ''
    click_link 'Sign in'
    expect(page).to have_page_title 'Sign in'
    click_link 'Articles'
    expect(page).to have_page_title 'Articles'
    click_link 'Upcoming Events'
    expect(page).to have_page_title 'Events'
    click_link 'About'
    expect(page).to have_page_title 'About DevCon'
  end

  describe '404 routing' do
    before { visit '/test' }
    let(:heading)    { 'Error 404' }
    let(:page_title) { 'Error 404' }

    it_should_behave_like 'all static pages'
  end

  describe '404 RecordNotFound' do
    before { visit '/events/meh' }
    let(:heading)    { 'Error 404' }
    let(:page_title) { 'Error 404' }

    it_should_behave_like 'all static pages'
  end

  describe '500' do
    before do
      expect(Event).to receive(:upcoming).and_raise('test exception')
      visit root_path
    end
    let(:heading)    { 'Error 500' }
    let(:page_title) { 'Error 500' }

    it_should_behave_like 'all static pages'
  end
end
