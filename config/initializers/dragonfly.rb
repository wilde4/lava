require 'dragonfly/rails/images'

app = Dragonfly::App[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.configure_with(:heroku, ENV['S3_BUCKET'])
app.define_macro(ActiveRecord::Base, :image_accessor)