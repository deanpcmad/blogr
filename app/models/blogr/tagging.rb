module Blogr
  class Tagging < ActiveRecord::Base

    belongs_to :tag, class_name: "Blogr::Tag"
    belongs_to :post, class_name: "Blogr::Post"

  end
end