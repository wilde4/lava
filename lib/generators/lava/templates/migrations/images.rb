class CreateElementsTable < ActiveRecord::Migration
  def self.up
    create_table :images, :force => true do |t|
      t.string   :upload_content_type
      t.string   :upload_file_size
      t.string   :upload_uid
      t.string   :upload_name
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :caption
      t.string   :url
    end
  end

  def self.down
    drop_table :images
  end
end

