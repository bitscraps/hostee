class MarketingController < ApplicationController
  skip_before_filter :check_account

  def index
  end

end
