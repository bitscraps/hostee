class TeaserController < ApplicationController
  def index
  	if request.post?
		@maillist = Maillist.new(params[:maillist])
		if @maillist.save
			@saved = true
		end		
	end 
  end

end
