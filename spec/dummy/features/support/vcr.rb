# VCR.config do |config|
#   config.stub_with :webmock
#   config.cassette_library_dir = "features/cassettes"
#   config.default_cassette_options = { :record => :new_episodes }
#   config.ignore_localhost = true
# end

# VCR.cucumber_tags do |cuke|
#   cuke.tag "vcr"

#   cuke.tag "twitter_user_search_response"
#   cuke.tag "twitter_keyword_search_response"
#   cuke.tag "twitter_mentions_search_response"
#   cuke.tag "twitter_direct_search_response"

#   cuke.tag "facebook_search_response"
#   cuke.tag "youtube_search_response"
# end