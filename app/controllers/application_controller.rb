class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

  def authenticate
    if session[:username].nil?
      respond_to do |format|
        format.html { redirect_to manager_login_path, alert: "请登录后再使用后台系统" }
        format.json { render json: {code: 403, message: "请登录后再使用后台系统"}, status: :forbidden }
      end
    end
  end

end
