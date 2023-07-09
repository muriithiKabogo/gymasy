class GymsController < ApplicationController
	before_action :authenticate_admin!
	def new
		@admin = current_admin
		@gym = Gym.new

	end

	def create
		@admin = current_admin
		if @admin.gyms.create(name: params[:name])
			redirect_to root_path
		else
			render 'new', status: :unprocessable_entity
		end
	end
end
