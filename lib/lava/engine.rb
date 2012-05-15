require "haml"
require "simple_form"

module Lava

  class Engine < Rails::Engine
    engine_name :lava
    
    initializer "lava.load_app_instance_data" do |app|
      Lava.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "lava.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end

end