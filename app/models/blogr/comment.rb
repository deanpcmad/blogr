module Blogr
  class Comment < ActiveRecord::Base

    belongs_to :post, class_name: "Blogr::Post"
    belongs_to :user, class_name: "Blogr::User"

    validates_presence_of :post_id, :content

  end
end