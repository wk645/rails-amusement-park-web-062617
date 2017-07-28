class AttractionsController < ApplicationController

	# before_action :is_admin?, only [:new, :create, :edit, :update]

	helper_method :current_user

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			redirect_to attraction_path(@attraction)
		else
			render :new
		end
	end

	def show
		@attraction = Attraction.find_by(id: params[:id])
		session[:current_attraction_id] = @attraction.id
	end

	def index
		@attractions = Attraction.all
		@user = User.find_by(id: session[:user_id])
	end

	def edit
		@attraction = Attraction.find_by(id: params[:id])
	end

	def update
		@attraction = Attraction.find_by(id: params[:id])
		if @attraction.update(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			render :edit
		end
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end

end
