class IndustriesController < ApplicationController
	def index
		@industries = Industry.all
	end
	def new
		@industry = Industry.new
	end
	def create
		@industry = Industry.new(params[:industry])

		if @industry.save
			redirect_to industries_path
		else
			render new
		end
	end
	def destroy
		@industry = Industry.find(params[:id])
		@industry.destroy
		redirect_to industries_path
	end
end
