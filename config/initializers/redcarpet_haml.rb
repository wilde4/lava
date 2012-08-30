module Haml::Filters::Markdown
  include Haml::Filters::Base
  lazy_require 'redcarpet'
  def render(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, $Application.markdown).render(text).html_safe
  end
end