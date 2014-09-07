require 'spec_helper'

describe 'ApplicationHelper', :type => :helper do

  describe '::flash_class' do
    it 'should return proper CSS classes' do
      expect(flash_class('notice')).to eq('alert alert-info')
      expect(flash_class('success')).to eq('alert alert-success')
      expect(flash_class('error')).to eq('alert alert-danger')
      expect(flash_class('alert')).to eq('alert alert-danger')
    end
  end

  describe 'full_title' do
    it 'should include the page name' do
      expect(full_title('foo')).to match(/^foo/)
    end

    it 'should include the base name' do
      expect(full_title('foo')).to match(/Developers Connect/)
    end

    it 'should not include a dash for the home page' do
      expect(full_title('')).not_to match(/\-/)
    end
  end
end
