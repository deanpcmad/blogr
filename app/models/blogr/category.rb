module Blogr
  class Category < ActiveRecord::Base

    has_many :posts, class_name: "Blogr::Post"

    before_validation { self.permalink = self.title.parameterize if self.title }

    validates_uniqueness_of :title, :permalink
    validates_presence_of :title, :permalink

    def to_param
      permalink
    end

  end
end