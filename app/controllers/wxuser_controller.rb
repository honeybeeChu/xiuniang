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
    # redirect_to wxuser_wxuserInfo_path
    Thread.new{saveWxUsers()}

    render :json => {:err_msg => '获取成功'}

  end

  private
  def emoji_filter(str)
    pattern = /[\u{1F300}-\u{1F64F}\u{1F680}-\u{1F6FF}\u{1F1E6}-\u{1F1FF}-\u{1F195}-\u{1F981}\u231A\u231B\u23E9-\u23EC\u23F0\u23F3\u2614\u2615\u2648-\u2653\u267F\u2693\u26A1\u26AA\u26AB\u26B3-\u26BD\u26BF-\u26E1\u26E3-\u26FF\u2705\u270A\u270B\u2728\u274C\u274E\u2753\u2757\u2795\u2796\u2797\u27B0\u27BF\u{1F1E6}-\u{1F1FF},'🦁','🦄',' ']/x
    str.gsub(pattern, '')
  end

  def saveWxUsers
    begin
      $client ||= WeixinAuthorize::Client.new(WX_APPID, WX_SECRET)

      # wxuserArray = Array.new
      # (0..2).each do |i|
      #   new_wxuser = WxUser.new
      #       new_wxuser.id=i
      #           new_wxuser.openid=i
      #           new_wxuser.nickname="name#{i}"
      #           new_wxuser.sex="a"
      #           new_wxuser.language="222"
      #           new_wxuser.city="ciyt"
      #           new_wxuser.province="fdsa"
      #   wxuserArray.push new_wxuser.to_hash
      # end
      # puts wxuserArray
      # WxUser.create(wxuserArray)

      wxusers =  $client.followers WxUser.last.openid# 获取所有的粉丝信息
      wxuserArray = Array.new
      if wxusers.en_msg == "ok"
        # WxUser.destroy_all

        result = wxusers.result
        openidArray = result[:data][:openid]
        openidArray.each do |openid|
          wxuserObj = $client.user openid
          if wxuserObj.en_msg == "ok"
            wxuser = wxuserObj.result
            # if WxUser.find_by_openid(openid).nil?
              new_wxuser = WxUser.new
              new_wxuser.openid=wxuser[:openid]
              new_wxuser.nickname=emoji_filter(wxuser[:nickname])
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

              wxuserArray.push new_wxuser.to_hash

              new_wxuser.save
            # end
          end
        end

        # WxUser.create(wxuserArray).save!

        # oGIF7tzQCLiJce7SeAKc7IDGzqE8 oGIF7tzDb5iUibLUCRKroVjkWLbw
      end
    rescue Exception => e
      puts e.message
      WX_LOGGER.info "同步微信粉丝入库异常．"
    end

  end

end