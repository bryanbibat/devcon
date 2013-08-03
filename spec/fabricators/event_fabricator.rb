Fabricator(:event) do
  name { sequence(:name) { |n| "Event-#{n + 1}" } }
  slug { sequence(:slug) { |n| "event-#{n + 1}" } }
  description { sequence(:description) { |n| "Best event #{n + 1}" } }
  venue
  start_at Time.now
  end_at 5.hours.from_now
  summary { sequence(:summary) { |n| "Good event #{n + 1}" } }
end
