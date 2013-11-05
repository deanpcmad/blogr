require "redcarpet"
require "pygments"

module Blogr
  module PostsHelper

    def check_category post_object, category_object
      attr = {}
      if post_object.categories.pluck(:id).include?(category_object.id)
        attr[:checked] = 'checked'
      end

      return attr
    end

    def markdown(text)
      redcarpet = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true, :autolink => true, :space_after_headers => true, :underline => true, :highlight => true)
      redcarpet.render(text)
    end

    class HTMLwithPygments < Redcarpet::Render::HTML
      def header(text, header_level)
        "<h#{header_level + 1}>#{text}</h#{header_level + 1}>"
      end

      def block_code(code, language)
        title = nil
        code.gsub!(/\A\:\:(.*)$/) { title = $1 ; nil }
        String.new.tap do |s|
          s << "<p class='codeTitle'>#{title}</p>" if title
          s << Pygments.highlight(code, :lexer => language)
        end
      rescue 
        "<div class='highlight'><pre>#{code}</pre></div>"
      end
    end

  end
end
