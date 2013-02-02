Fabricator(:article) do
  title { sequence(:title) { |i| "This is a title #{i}" } }
  content 'This is the content'
  author { Fabricate(:author) }
end
