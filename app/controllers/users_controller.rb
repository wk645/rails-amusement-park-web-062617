require 'pry'
class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if !@user.save
			render :new
			redirect_to new_user_path
		else
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		if !logged_in?
			redirect_to home_path
		end
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update

	end

	def destroy
		session.delete :user_id
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :password_confirmation, :admin)
	end
end
