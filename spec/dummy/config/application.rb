require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require
require "gretel"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails.version.to_f
    config.secret_token = "secret token"
    config.active_support.deprecation = :log
    config.eager_load = false
  end
end
