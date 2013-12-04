module Blogr
  class Tag < ActiveRecord::Base

  	has_many :taggings, class_name: "Blogr::Tagging"
  	has_many :posts, through: :taggings, class_name: "Blogr::Post"

  	before_validation { self.permalink = name.parameterize }

  	def to_param
  		permalink
  	end

  end
end