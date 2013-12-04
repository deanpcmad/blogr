require_dependency "blogr/application_controller"

module Blogr
  class UsersController < ApplicationController

  	before_action :set_user, only: [:edit, :update, :destroy]

		def index
			@title = "Users"
			@users = Blogr::User.all
		end

		def new
			@title = "New User"
			@user = User.new
		end

		def edit
			@title = "Editing '#{@user.username}'"
		end

		def create
			@user = User.new(user_params)

			if @user.save
				redirect_to users_path, notice: "User was successfully created"
			else
				render action: "new"
			end
		end

		def update
			if @user.update(user_params)
				redirect_to users_path, notice: "User was successfully updated"
			else
				render action: "edit"
			end
		end

		def destroy
			@user.destroy
			redirect_to users_path, notice: "User was successfully destroyed"
		end

		private

		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
		end

  end
end
