class HomeController < ActionController::Base
  protect_from_forgery
  
   def index   
   	if(session[:access_token])
   		redirect_to new_possession_path
   	else
	   	session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/possessions/new')
		@auth_url =  session[:oauth].url_for_oauth_code(:permissions=>["read_stream", "publish_stream"]) 	
		@company = Company.new

	  	respond_to do |format|
				 format.html {  }
		end
	end
  end
  def signout
  	session[:oauth] = nil
  	session[:access_token] = nil
  	redirect_to root_url
  end
	def callback
  	
	end

	def job_request
		@requested_job = Job.find_all_by_company_id(params[:company_id])
		if @requested_job.blank?
			respond_to do |format|
				format.html {render :text => "record not found"}
				format.json {}
			end
		else
			respond_to do |format|
				format.html {render :text => @requested_job}
				format.json {render json: @requested_job}
			end
		
		end
	end
end

