describe 'ApplicationHelper' do

  describe 'full_title' do
    it 'should include the page name' do
      full_title('foo').should =~ /^foo/
    end

    it 'should include the base name' do
      full_title('foo').should =~ /Developers Connect/
    end

    it 'should not include a dash for the home page' do
      full_title('').should_not =~ /\-/
    end
  end
end