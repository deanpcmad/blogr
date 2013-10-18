module Simpleblog
  module PostsHelper

    def check_category post_object, category_object
      attr = {}
      if post_object.categories.pluck(:id).include?(category_object.id)
        attr[:checked] = 'checked'
      end

      return attr
    end

  end
end
