Fabricator(:category) do
  name { sequence(:category) { |i| "Best Category #{i}" } }
  description "This is the best category evar! Nevar forget."
end
