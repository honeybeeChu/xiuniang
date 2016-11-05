require 'net/http'
class ManagerController < ApplicationController
  skip_before_filter :authenticate
  def login
    render 'login',layout:'login'
  end


  def loginCheck
    username = params[:username]
    password = params[:password]

    @login_name=username = params[:username]
    if username == 'admin' && password='admin'
      session[:username]=username
      redirect_to dianyuan_dianyuanInfo_path
    end
  end





end
