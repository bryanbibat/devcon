namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    10.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = 'password'
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    users = User.all(:limit => 5)
    50.times do
      title = Faker::Company.catch_phrase
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.articles.create!(:title => title, :content => content) }
    end
  end
end