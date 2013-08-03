Fabricator(:venue) do
  name { sequence(:name) { |n| "Venue-#{n + 1}" } }
  slug { sequence(:slug) { |n| "venue-#{n + 1}" } }
  address { sequence(:address) { |n| "Address-#{n + 1}" } }
  latitude    "9.99"
  longitude   "9.99"
  description { sequence(:description) { |n| "Description-#{n + 1}" } }
end
