require "lava/engine"

require "active_support/dependencies"
require "haml"
require "simple_form"

module Lava

  # mattr_accessor :app_root

  module Controllers
    #autoload :Helpers, 'lava/controllers/helpers'
  end

  module Helpers
    # autoload something
  end

  module Models
    autoload :Element,   "lava/models/element"
    autoload :Image,     "lava/models/image"
  end

  def self.setup
    yield self
  end

end
