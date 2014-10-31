$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lava/version"

Gem::Specification.new do |s|
  s.name          = "lava"
  s.version       = Lava::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Robert Wilde"]
  s.email         = ["r.wilde@volcanic.co.uk"]
  s.homepage      = "http://www.volcanic.co.uk"
  s.description   = "CMS Develoepd by Volcanic"
  s.summary       = "lava-#{s.version}"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "dragonfly", '~>1'
end