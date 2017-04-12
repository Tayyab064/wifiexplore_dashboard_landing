class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

	def is_lender
		if session[:lender].present?
			unless u = User.find_by_email(session[:lender])
			    if u.blocked == false
					redirect_to lender_signin_page_path
			    end
			end
			@lender = u
		else
			redirect_to lender_signin_page_path
		end
	end
end
