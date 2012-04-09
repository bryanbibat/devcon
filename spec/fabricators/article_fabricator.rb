Fabricator(:article) do
  title 'This is a title'
  content 'This is the content'
  author { Fabricate(:user) }
  categories { Fabricate.sequence(:category) }
end
