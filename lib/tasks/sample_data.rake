namespace :db do
  desc 'Fill database with sample data'
  task :populate => :environment do
    5.times do |n|
      name = Faker::Name.name
      email = "demo-#{n}@example.com"
      password = 'password'
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    users = User.all
    5.times do
      users.each do |user|
        title = Faker::Company.catch_phrase
        content = Faker::Lorem.sentence(20)
        user.articles.create!(:title => title, :content => content)
      end
    end
  end
end