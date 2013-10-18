module Simpleblog
  class CategoriesPost < ActiveRecord::Base
    validates_uniqueness_of :category_id, :scope => [:post_id]
  end
end
