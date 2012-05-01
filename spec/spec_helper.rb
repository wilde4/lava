ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require "rspec/rails"
require "factory_girl"
require "shoulda/matchers"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  
  config.include Lava::Engine.routes.url_helpers

  FactoryGirl.factories.clear

  Dir[Rails.root.join('spec/factories/*.rb')].each  { |f| load f }
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

end