class CreateElementsTable < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      
    end
  end

  def self.down
    drop_table :elements
  end
end
