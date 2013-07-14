class ClientsController < ApplicationController
  layout 'webapp'
  
  def index
  	@clients = Client.find_all_by_user_id(@current_user.id)
  end

  def view
  end

  def create
  	@client = Client.new
  
  	if request.post?
  		@client = Client.new(params[:client])
  		@client.user_id = @current_user.id
  		if @client.save
  			redirect_to :controller => 'clients', :action => 'index' and return
		  end
  	end
  	
  	render :layout => 'lightbox'
  end

  def edit
    @client = Client.find_by_id(params[:id])
    
    if request.post?
        @client = Client.update(params[:id], params[:user])
        if @client.save
          	redirect_to :controller => 'clients', :action => 'index' and return
        end
    end
    
  	render :layout => 'lightbox'
  end

end
