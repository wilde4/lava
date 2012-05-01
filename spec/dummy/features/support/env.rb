require 'cucumber/rails'
require 'ruby-debug'

Capybara.configure do |config|
  config.default_selector         = :css
  config.default_wait_time        = 5
  config.ignore_hidden_elements   = false
  config.prefer_visible_elements  = true
  config.save_and_open_page_path  = "/tmp/capybara"
  # config.default_driver           = :capybara_webkit
end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

