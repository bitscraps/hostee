class DashboardController < ApplicationController
  before_filter :check_account
  layout 'webapp'
  
  def index

  end

end
