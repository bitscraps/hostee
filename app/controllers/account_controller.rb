class AccountController < ApplicationController
  
  def new
  
  		@account = Account.new
  		if request.post?
  			@account = Account.new(params[:account])
  			@account.expires_at = Time.now + 14.days
  			if @account.save
  				redirect_to :action => "congratulations"		
  			end
				
  		end
  end
  
  def congratulations
  
  end

end
