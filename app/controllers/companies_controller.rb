class CompaniesController < ApplicationController
  before_filter :signed_in_company, only:  [:edit, :update]
  before_filter :correct_company, only: [:edit, :update, :destroy]
	def index
	    @companies = Company.all
  end

  def new
    	@company = Company.new
	      format.html # new.html.erb
	    
  end 

  def create
    @company = Company.new(params[:company])
      if @company.save
        sign_in @company
        redirect_to @company

      else
        redirect_to root_url 
      end
  end
  

    def show
    	 @company = Company.find(params[:id])

	    respond_to do |format|
	      format.html
	      format.json { render json: @company }
	    end
    end

    def edit
       @company = Company.find(params[:id])
    end

    def update
      @company = Company.find(params[:id])

      respond_to do |format|
        if @company.update_attributes(params[:company])
          sign_in company
          format.html { redirect_to @company, notice: 'Company was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @company = Company.find(params[:id])
      @company.destroy

      respond_to do |format|
        format.html { redirect_to companies_url }
        format.json { head :ok }
      end
    end

    private

    def signed_in_company
      unless signed_in?
        redirect_to signin_url, notice: "please sign in."
      end
    end

    def correct_company
      @company = Company.find(params[:id])
      redirect_to(root_path) unless current_company?(@company)

    end
  
end