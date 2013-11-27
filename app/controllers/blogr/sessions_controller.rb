require_dependency "blogr/application_controller"

module Blogr
  class SessionsController < ApplicationController

  	layout "blogr/login"

  	before_filter :authorize, except: [:new, :create]

    def index
    	redirect_to login_path		
    end
    
    def new
    	if current_blogr_user
    		redirect_to root_path
    		flash[:error] = "You are already logged in"
    	end

    	@title = "Login"
    	session[:return_to] = params[:return_to] if params[:return_to]
    end

    def create
    	user = User.find_by_username(params[:username]) || User.find_by_email(params[:username])
    	if user && user.authenticate(params[:password])
    		session[:user_id] = user.id
    		redirect_to root_path, notice: "Welcome back #{user.first_name}, time to get blogging!"
    	else
    		flash[:error] = "Username or password is invalid"
    		render "new"
    	end
    end

    def destroy
    	session[:user_id] = nil
    	redirect_to login_path, :notice => "Logged out!"
    end

  end
end