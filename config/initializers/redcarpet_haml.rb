module Haml::Filters::Markdown
  include Haml::Filters::Base
  lazy_require 'redcarpet'

  def render(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, {:autolink => false, :space_after_headers => true}).render(text)
  end
end