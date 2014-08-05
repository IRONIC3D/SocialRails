source 'https://rubygems.org'

gem 'rails', '3.2.18'
gem 'sprockets-rails', '=2.0.0.backport1'
gem 'sprockets', '=2.2.2.backport2'
gem 'bootstrap-sass', '~> 3.2.0.0'
gem 'autoprefixer-rails'
group :assets do
  gem 'sass-rails', github: 'guilleiguaran/sass-rails', branch: 'backport'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise'

group :development, :test do
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-test'
end

group :test do
  gem 'ruby-prof'
  gem 'shoulda', '~> 3.5.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
