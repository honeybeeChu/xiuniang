class MembershipController < ApplicationController
  require "open-uri"
  require 'net/https'
  require 'uri'
  layout 'main'

  def index
    redirect_uri = url_encode(APP_SERVER+'/membership/redirect')

    MEMBERSHIP_LOGGER.info "weixin redirect url: #{redirect_uri}"
    code_url =WX_OAUTH_CODE_URL+'&redirect_uri='+redirect_uri+'&response_type=code&scope=snsapi_base&state=1#wechat_redirect'

    MEMBERSHIP_LOGGER.info "weixin code_url url: #{redirect_uri}"
    redirect_to code_url

  end

  # 微信的二次重定向地址，获取用户的个人信息
  def redirect
    code = params[:code]
    MEMBERSHIP_LOGGER.info "code value is #{code}"

    url = WX_OAUTH_REDIRECT_RUL+code+'&grant_type=authorization_code'

    MEMBERSHIP_LOGGER.info "weixin getuserinfo url is #{url}"

    data = post(url)
    if data['errcode'].nil?
      @openid = data['openid']
      #如果没有注册会员信息，那么就跳转到开卡会员注册的页面
      render "openCard"

      #如果已经注册是会员，那么跳转到会员的信息页面
    end
  end


  # 相应获取验证码的按钮点击，发送验证码
  def sendsms
    telephone = params[:telephone]
    session[:telephone] = telephone

    checknum = getRandomNumber
    session[:checknumber] = checknum

    uri = SMS_URL+"&mobile=#{telephone}&content=您的验证码是：#{checknum}。请不要把验证码泄露给其他人。"
    MEMBERSHIP_LOGGER.info "验证码请求ｕｒｉ：#{uri}"
    html_response = nil
    url_escape = URI::escape(uri)
    open(url_escape) do |http|
      html_response = http.read
    end
    MEMBERSHIP_LOGGER.info html_response
    render json: {result:0}
  end


  # 相应开通会员的按钮，调用开通会员的接口，开通会员
  def opencardsubmit

  end


  private

  def getRandomNumber
    return "#{rand(10)}#{rand(10)}#{rand(10)}#{rand(10)}"
  end
  # 跳转会员信息页面
  def showInfo

  end



  def url_encode(str)
    str.to_s.gsub(/[^a-zA-Z0-9_\-.]/n){ sprintf("%%%02X", $&.unpack("C")[0]) }
  end

  def post(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == "https"
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    return JSON.parse(response.body)
  end

end
