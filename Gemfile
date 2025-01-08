source "http://rubygems.org"

gemspec

rails_version = ENV['RAILS_VERSION'] || '>= 0'
rails_version = "~> #{rails_version}" if rails_version =~ /^\d/

gem 'rails', rails_version == 'main' ? { github: 'rails/rails' } : rails_version
gem 'sqlite3', rails_version =~ /^\d/ && rails_version < '8' ? '~> 1.4' : '>= 2.0'
