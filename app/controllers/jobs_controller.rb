class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end
	def edit
		@job = Job.find(params[:id])

	end
	def new
		@job = Job.new
	end
	def create
		@job = Job.new(params[:job])
		if @job.save
			redirect_to @job
			@notice= "Job has successfully created" 
		else
			render new
		end
	end
	def show
		@job = Job.find(params[:id])
		
	end
	def update
		@job = Job.find(params[:id])
		if @job.update_attributes(params[:job])
			render @job
		else
			render "edit"
		end
	end
	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_url
	end
end
