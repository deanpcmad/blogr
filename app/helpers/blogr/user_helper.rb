module Blogr

	module UserHelper
		def gravatar(email, options = {})
			options[:size]    ||= 35
			options[:default] ||= "identicon"
			options[:rating]  ||= "PG"
			options[:class]   ||= "gravatar"
			options[:secure]  ||= request.ssl?
			host = (options[:secure] ? "https://secure.gravatar.com" : "http://gravatar.com")
			path = "/avatar?gravatar_id=#{Digest::MD5.hexdigest(email)}&rating=#{options[:rating]}&size=#{options[:size] * 2}&d=#{options[:default]}"
			image_tag([host,path].join, :class => options[:class], :width => options[:size], :height => options[:size])
		end
	end

end