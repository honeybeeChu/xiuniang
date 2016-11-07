class WxuserController < ApplicationController
  layout 'manager'


  def wxuserInfo

    if params[:nickname].nil? || params[:nickname].strip == ""
      @wxusers_account = WxUser.all.size
      @wxusers = WxUser.paginate(page:params[:page],per_page:10)
      @current_page = params[:page] == nil ? 1 : params[:page]
      render "wxuserInfo"
    else
      nickname = params[:nickname].strip
      result_wxusers = WxUser.where("nickname LIKE '%#{nickname}%'")
      @wxusers = result_wxusers.paginate(page:params[:page],per_page:10)
      @wxusers_account = result_wxusers.length
      @current_page = params[:page] == nil ? 1 : params[:page]
      @current_nickname = params[:nickname]
      render "wxuserInfo"
    end
  end

  def distribution
    # 分组店员的店铺信息
    wxuser_by_province = WxUser.group_province
    @datavalues = Array.new
    wxuser_by_province.each  do |item|
      obj=Hash.new
      obj[:name] = item[1]
      obj[:value] = item[0].to_i
      @datavalues.push obj
    end
    render "wxuserChart"
  end


  def synchronizeWxuser
    begin
    $client ||= WeixinAuthorize::Client.new(WX_APPID, WX_SECRET)
    wxusers =  $client.followers
    if wxusers.en_msg == "ok"
      result = wxusers.result
      openidArray = result[:data][:openid]
      openidArray.each do |openid|
        wxuserObj = $client.user openid
        if wxuserObj.en_msg == "ok"
          wxuser = wxuserObj.result
          if WxUser.find_by_openid(openid).nil?
            new_wxuser = WxUser.new
            new_wxuser.openid=wxuser[:openid]
            new_wxuser.nickname=wxuser[:nickname]
            new_wxuser.sex=wxuser[:sex]
            new_wxuser.language=wxuser[:language]
            new_wxuser.city=wxuser[:city]
            new_wxuser.province=wxuser[:province]
            new_wxuser.country=wxuser[:country]
            new_wxuser.headimgurl=wxuser[:headimgurl]
            new_wxuser.subscribe_time=wxuser[:subscribe_time]
            new_wxuser.unionid=wxuser[:unionid]
            new_wxuser.remark=wxuser[:remark]
            new_wxuser.groupid=wxuser[:groupid]
            new_wxuser.subscribe=wxuser[:subscribe]
            new_wxuser.phone=wxuser[:phone]
            new_wxuser.is_member=false
            new_wxuser.save
          end
        end
      end
    end
    rescue
      redirect_to wxuser_wxuserInfo_path
    end


    redirect_to wxuser_wxuserInfo_path
  end
end
