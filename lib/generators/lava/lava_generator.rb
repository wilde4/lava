require "rails/generators"
require "rails/generators/migration"

class LavaGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), "templates")
  end

  def self.next_migration_number(dirname)
    Time.new.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_file
    path = "db/migrate"
    models = %w{elements images}

    models.each do |m|
      migration_template "migrations/#{m}.rb", "#{path}/create_#{m}_table.rb"
      sleep 1 # datestamps need to be unique
    end
  end

  def copy_assets; end

  def copy_controllers
    path = "app/controllers"
    controllers = %w{elements}

    controllers.each do |c|
      template "controllers/#{c}.rb", "#{path}/#{c}_controller.rb"
    end
  end

  def copy_initializer
    template "lava.rb", "config/initializers/lava.rb"
  end

  def copy_seeds
    template "seeds.rb", "db/seeds.rb"
  end

  def show_readme
    readme "readme" if behavior == :invoke
  end

end