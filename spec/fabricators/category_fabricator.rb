Fabricator(:category) do
  name "Best Category"
  description "This is the best category evar! Nevar forget."
  articles(:count => 1)
end
