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
      redcarpet = Redcarpet::Markdown.new(HTMLwithPygments, fenced_code_blocks: true, with_toc_data: true)
      redcarpet.render(text)
    end

    class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygments.highlight(code, lexer: language)
      end
    end

  end
end
