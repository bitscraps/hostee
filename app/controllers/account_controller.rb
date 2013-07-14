class AccountController < ApplicationController
  layout 'lightbox'
  
   skip_before_filter :check_account

  def signup
  	if request.post?
  		@account = Account.new(params[:account])
  		@account.account_type = 'Trial'
  		@account.expires_at = Time.now + 14.days
  	
  		
  		if @account.save	
	  		@form = "<center><h2>CONGRATULATIONS</h2></center><p>Your account has been created successfully.</p><p>All thats left is for you to sign in.</p>"
	  	else
	  		@form = render_to_string :partial => 'account/signupform'
		end		
		  		
  		render :update do |page|
  			 page.replace_html "signup-form", @form

   
  		end
  	end
  end

  def login
  	#TODO - cookie sign in
  	#TODO - additional action links.
  	if request.post?
  		render :update do |page|
	  		if params[:username] != '' && params[:password] != ''
	  			@account = Account.find_by_username_and_password(params[:username], params[:password])
	  			
	  			if @account			
	  				session[:username] = params[:username]
	  				
	  				if params[:keep_me_signed_in] == '1'
	  					cookies[:username] = { :value => params[:username], :expires => 30.days.from_now }
	  					@account.verification = rand(36**64).to_s(36)
	  					
	  					cookies[:verification] = { :value => @account.verification, :expires => 30.days.from_now }
	  				end
	  		 		page.redirect_to :controller => 'dashboard', :action => 'index'
	  			end
	  		else
	  			page.visual_effect :shake, 'username' if params[:username] == ''
	 			page.visual_effect :shake, 'password' if params[:password] == ''
	   		end
		end
	else
		if cookies[:username]  && cookies[:verification]
			@account = Account.find_by_username_and_verification(cookies[:username], cookies[:verification])
			session[:username] = cookies[:username]
			if @account	
				render :update do |page|
		  			page.redirect_to :controller => 'dashboard', :action => 'index'
		  		end
			end
		end
  	end
  end

  def logout
  	session[:username] = nil
  	cookies[:username] = nil
  	cookies[:verification] = nil
  	redirect_to :controller => 'dashboard', :action => 'index'
  end

  def forgot_password
  	#TODO - forgot password reminder
  end
  
  def expired
  
  end

end
