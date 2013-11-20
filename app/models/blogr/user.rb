module Blogr
  class User < ActiveRecord::Base

  	has_secure_password

  	validates_presence_of :first_name, :last_name, :username, :email, :password

  	def name
  		[first_name, last_name].join(" ")	
  	end

  end
end