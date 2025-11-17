source "http://rubygems.org"

gemspec

rails_version = ENV['RAILS_VERSION'] || '>= 0'
case rails_version
when 'main', '>= 0'
  gem 'rails', rails_version == 'main' ? { github: 'rails/rails' } : rails_version
  gem 'sqlite3', '>= 2.0'
when '6.1.0', '7.0.0'
  gem 'rails', "~> #{rails_version}"
  gem 'sqlite3', '~> 1.4'
  gem 'concurrent-ruby', '1.3.4' # SEE: https://stackoverflow.com/a/79361034
else
  gem 'rails', "~> #{rails_version}"
  gem 'sqlite3', rails_version < '8' ? '~> 1.4' : '>= 2.0'
end

gem 'rspec-rails'
gem 'simplecov'
gem 'simplecov-erb'

gem "puma", "~> 7.1"
