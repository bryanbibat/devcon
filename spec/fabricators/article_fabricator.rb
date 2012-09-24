Fabricator(:article) do
  title 'This is a title'
  content 'This is the content'
  author { Fabricate(:author) }
end
