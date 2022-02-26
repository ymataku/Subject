# coding: UTF-8
$:.unshift(File.expand_path('../../lib', __FILE__))
Encoding.default_internal = 'UTF-8'

gem 'test-unit', '>= 2' # necessary when not using bundle exec

require 'test/unit'
require 'nokogiri'

require 'greenmat'
require 'greenmat/render_strip'
require 'greenmat/render_man'

class Greenmat::TestCase < Test::Unit::TestCase
  def assert_renders(html, markdown)
    assert_equal html, render(markdown)
  end

  def render(markdown, options = {})
    options = options.fetch(:with, {})

    if options.kind_of?(Array)
      options = Hash[options.map {|o| [o, true]}]
    end

    render = begin
      renderer.new(options)
    rescue ArgumentError
      renderer.new
    end

    parser = Greenmat::Markdown.new(render, options)

    parser.render(markdown).chomp
  end

  private

  def renderer
    @renderer ||= Greenmat::Render::HTML
  end

  # Imported from Active Support
  class ::String
    def strip_heredoc
      indent = scan(/^ *(?=\S)/).min.size || 0
      gsub(/^[ \t]{#{indent}}/, '')
    end
  end
end
