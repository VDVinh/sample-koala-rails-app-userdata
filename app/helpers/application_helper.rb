
module ApplicationHelper
  def sign_in(company)
    cookies.permanent[:remember_token] = company.remember_token
    self.current_company = company
  end

  def current_company=(company)
  	@current_company = company
  end

  def current_company
    @current_company ||= Company.find_by_remember_token(cookies[:remember_token])
  end

  def current_company?(company)
    company == current_company
  end

  def signed_in_company
    unless signed_in?
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  def signed_in?
    !current_company.nil?
  end
  def sign_out
    self.current_company = nil
    cookies.delete(:remember_token)
  end

end
