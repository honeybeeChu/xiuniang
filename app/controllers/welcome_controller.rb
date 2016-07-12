class WelcomeController < ApplicationController
  def index

  end

  def show
    @store = Store.find(params[:storeid])
  end
end
