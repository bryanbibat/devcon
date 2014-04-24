Fabricator(:tag) do
  name "Best Tag"
  description "This is the best tag ever"
  articles(:count => 1) { |attrs, i| Fabricate(:article, title: "tagged#{i}") }
end
