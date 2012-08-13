class CreateElementsTable < ActiveRecord::Migration
  def self.up
    create_table :elements, :force => true do |t|    
      t.string   :reference
      t.string   :element_type
      t.string   :upload_content_type
      t.integer  :upload_file_size
      t.string   :upload_uid
      t.string   :upload_name
      t.text     :value
      t.text     :url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :elements
  end
end
