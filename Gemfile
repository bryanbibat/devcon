source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bootstrap-sass', '2.0.0'
gem 'devise', '2.1.0.rc'

# Formtastic gem branches compatible with Bootstrap 2.0
# The master branches are not yet compatible with 2.0 at the moment
gem 'formtastic', :git => 'git://github.com/justinfrench/formtastic.git', :branch => '2.1-stable'
gem 'formtastic-bootstrap', :git => 'https://github.com/cgunther/formtastic-bootstrap.git', :branch => 'bootstrap2-rails3-2-formtastic-2-1'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.9.0'
  gem 'database_cleaner', '0.7.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.0'

group :test do
  gem 'capybara', '1.1.2'
end

group :production do
  gem 'pg', '0.12.2'
end