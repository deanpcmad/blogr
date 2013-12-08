module Blogr
  class User < ActiveRecord::Base

  	has_secure_password

  	validates_presence_of :first_name, :last_name, :username, :email, :password
    has_many :posts, class_name: "Blogr::Post"

  	def name
  		[first_name, last_name].join(" ")	
  	end

  end
end