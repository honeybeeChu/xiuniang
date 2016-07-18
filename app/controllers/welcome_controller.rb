class WelcomeController < ApplicationController
  def index
    @store = Store.find(params[:storeid])
  end

  def show
    @lat = params[:lat]
    @log = params[:log]
    @storeName = params[:name]

  end


end
