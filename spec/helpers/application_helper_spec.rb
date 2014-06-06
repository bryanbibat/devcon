describe 'ApplicationHelper', :type => :helper do

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