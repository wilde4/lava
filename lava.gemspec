require File.expand_path("../lib/lava/version", __FILE__)

Gem::Specification.new do |s|
  s.name          = "lava"
  s.version       = Lava::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Gavin Laking"]
  s.email         = ["gavinlaking@gmail.com"]
  s.homepage      = "http://"
  s.description   = ""
  s.summary       = "lava-#{s.version}"

  s.add_dependency 'aws-s3'
  s.add_dependency 'dragonfly',     '~> 0.9.11'
  s.add_dependency 'fog',           '~> 1.3.1'
  s.add_dependency 'haml',          '~> 3.1.4'
  s.add_dependency 'rack-cache',    '>= 0.5.3'
  s.add_dependency 'rmagick',       '~> 2.13.1'
  s.add_dependency 'simple_form',   '2.0.1'

  s.add_development_dependency "cucumber-rails",      "1.3.0"
  s.add_development_dependency "database_cleaner",    "0.7.2"
  s.add_development_dependency "factory_girl",        "2.6.3"
  s.add_development_dependency "json",                "1.6.6"
  s.add_development_dependency "kaminari",            "0.13.0"
  s.add_development_dependency "launchy",             "2.1.0"
  s.add_development_dependency "pickle",              "0.4.10"
  s.add_development_dependency "rspec-rails",         "2.9.0"
  s.add_development_dependency "selenium-webdriver",  "2.21.0"
  s.add_development_dependency "shoulda-matchers",    "1.0.0"

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map { |f|
    f =~ /^bin\/(.*)/ ? $1 : nil
  }.compact

  s.require_path = 'lib'
end