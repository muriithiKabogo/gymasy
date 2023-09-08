class GymsController < ApplicationController
	before_action :authenticate_admin!
	
	def index
	end

	def new
		@admin = current_admin
		@gym = Gym.new

	end

	def create
		#make sure one admin can only have one gym
		@admin = current_admin
		if @admin.gyms.create(name: params[:gym][:name])
			redirect_to admin_root_path
		else
			render 'new', status: :unprocessable_entity
		end
	end
end
