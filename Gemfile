source "http://rubygems.org"

gemspec

rails_version = ENV['RAILS_VERSION'] || '>= 0'
case rails_version
when 'main', '>= 0'
  gem 'rails', rails_version == 'main' ? { github: 'rails/rails' } : rails_version
  gem 'sqlite3', '>= 2.0'
else
  gem 'rails', "~> #{rails_version}"
  gem 'sqlite3', rails_version < '8' ? '~> 1.4' : '>= 2.0'
end
