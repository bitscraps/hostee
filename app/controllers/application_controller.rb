# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :check_account

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def check_account
  	if session[:username]
  		@current_user = Account.find_by_username(session[:username])
  		
  		if @current_user
  			
  			if @current_user.expires_at <= DateTime.now
				redirect_to :controller => 'account', :action => 'expired'
			end
  		else  			
	  		redirect_to :controller => 'marketing', :action => 'index'
  		end
  	else
  		unless params[:controller] == 'marketing' || params[:controller] == 'account'
	  		redirect_to :controller => 'marketing', :action => 'index'
		end
  	end
  end
  

end
