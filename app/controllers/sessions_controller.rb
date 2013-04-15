class SessionsController < ApplicationController
def create
  company = Company.find_by_email(params[:session][:email].downcase)
  if company && !session[:access_token] && company.authenticate(params[:session][:password])
    sign_in company
    redirect_to company
  else
    if session[:access_token]
      flash[:notice] = 'You have already sign in as user. Please signout!'
    else
      flash[:notice] = 'Invalid email/password combination' 
    end
    redirect_to signin_path
  end
end

def destroy
  sign_out
  redirect_to root_url
end

def new
end
end
