module Blogr
  class Tag < ActiveRecord::Base

  	has_many :taggings
  	has_many :posts, through: :taggings

  	before_validation { self.permalink = name.parameterize }

  	def to_param
  		permalink
  	end

  end
end