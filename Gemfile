source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg'

gem 'jbuilder'
gem 'normalize-rails'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'webpacker'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end
