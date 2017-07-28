class RidesController < ApplicationController

	def create
		# @user = session[:user_id]
		# @attraction = session[:current_attraction_id]
		ride = Ride.create(user_id: session[:user_id], attraction_id: session[:current_attraction_id])
		flash[:message] = ride.take_ride
		redirect_to user_path(ride.user)
	end
end
