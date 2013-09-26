require "haml"
require "simple_form"
require "digest/md5"

module Lava

  class Engine < ::Rails::Engine
    # isolate_namespace Lava
    
    # engine_name :lava
    # 
    # # initializer "lava.load_app_instance_data" do |app|
    # #   Lava.setup do |config|
    # #     config.app_root = app.root
    # #   end
    # # end
    # 
    # initializer "lava.load_static_assets" do |app|
    #   app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    # end
  end

end