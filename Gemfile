source "http://rubygems.org"

gemspec

rails_version = ENV['RAILS_VERSION'] || '>= 0'
rails_version = "~> #{rails_version}" if rails_version =~ /^\d/

gem 'rails', rails_version == 'main' ? { github: 'rails/rails' } : rails_version
gem 'sqlite3', rails_version == 'main' ? '>= 2.0' : '~> 1.4'
