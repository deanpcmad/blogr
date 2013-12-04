module Blogr
  class ApplicationController < ActionController::Base

  	# layout "blogr/application"

  	before_filter :authorize

  	private

  	helper_method :current_blogr_user
  	helper_method :authorize

		def current_blogr_user
	    if session[:user_id]
	      @current_blogr_user ||= User.find(session[:user_id])
	    end
	    rescue ActiveRecord::RecordNotFound
		end

	  def authorize
	    if current_blogr_user.nil?
	      redirect_to login_path
	    end
	  end

  end
end
