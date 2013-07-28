Fabricator(:authentication) do
  user
  provider { sequence(:provider) { |n| "provider-#{n + 1}" } }
  uid { sequence(:uid) { |n| "#{n + 1}" } }
end
