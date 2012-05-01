require 'dragonfly/rails/images'

app = Dragonfly::App[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_accessor)

app.configure do |c|
  # We must specify the image path so Dragonfly doesn't automatically
  # put the filename on the end which breaks images in production.
  c.url_format = '/s3/:job'
  
  if Rails.env.development? || Rails.env.test?
    c.datastore = Dragonfly::DataStorage::FileDataStore.new
    c.datastore.configure do |d|
      d.root_path = 'tmp/dragonfly'
      d.store_meta = false
    end
    
    #c.datastore = Dragonfly::DataStorage::S3DataStore.new
    #c.datastore.configure do |d|
    #  d.bucket_name = ""
    #  d.access_key_id = ""
    #  d.secret_access_key = ""
    #end
  end
  if Rails.env.production?
    #c.datastore = Dragonfly::DataStorage::S3DataStore.new
    #c.datastore.configure do |d|
    #  d.bucket_name = ""
    #  d.access_key_id = ""
    #  d.secret_access_key = ""
    #end
    # c.url_host = 'http://example.com'
  end
end