class WelcomeController < ApplicationController
  def index
    @store = Store.find(params[:storeid])
    @lat = params[:lat]
    @log = params[:log]

  end

  def show
    @lat = params[:lat]
    @log = params[:log]
    @storeName = params[:name]

  end

  # 导航ｒｏｕｔｅ
  def navigate
    @store = Store.find(params[:storeid])
    @lat = params[:lat]
    @log = params[:log]
    @storeName = params[:name]

  end



end
