# encoding: utf-8
# 1, @weixin_message: 获取微信所有参数.
# 2, @weixin_public_account: 如果配置了public_account_class选项,则会返回当前实例,否则返回nil.
# 3, @keyword: 目前微信只有这三种情况存在关键字: 文本消息, 事件推送, 接收语音识别结果
include Math
WeixinRailsMiddleware::WeixinController.class_eval do

  def reply
    render xml: send("response_#{@weixin_message.MsgType}_message", {})
  end

  private

    def response_text_message(options={})
      # reply_text_message("Your Message: #{@keyword}")
    end

    # <Location_X>23.134521</Location_X>
    # <Location_Y>113.358803</Location_Y>
    # <Scale>20</Scale>
    # <Label><![CDATA[位置信息]]></Label>
    def response_location_message(options={})
      @lx    = @weixin_message.Location_X
      @ly    = @weixin_message.Location_Y
      @scale = @weixin_message.Scale
      @label = @weixin_message.Label




      # 将用户发来的经纬度信息，转换成百度的经纬度
      baiduresult = JSON.parse(http_get_baidu @lx,@ly)

      @current_lat =  baiduresult['result'][0]['y']
      @current_log =  baiduresult['result'][0]['x']

      storeHash = getNearStores @current_lat,@current_log

      articles = Array.new
      storeHash.each do |key,value|
        @_title = "#{value[:business_name]}#{value[:branch_name]}: #{key}公里"
        article={"title":@_title,"description":"最近店铺距离",
                 "url":"http://xiuniang.yaxin-nanjing.com/welcome/index?storeid=#{value[:id]}&lat=#{@current_lat}&log=#{@current_log}",
                 "picurl":"http://mmbiz.qpic.cn/mmbiz/pZtBlJ86VibocrMbpbVQLib0Ao7Txt9YtewqCbGKksB8sonLBTLdxVwuIUjv7JrsTTQ7ns7g56T2qHxryy7D0Ldw/0?wx_fmt=jpeg"}

        articles.push(article)
      end

      @client = WeixinAuthorize::Client.new("wxa4de3c29bddd316e", "6d5dd9526242c753746ae3a8b54affe6")

      params = {
          "touser":@weixin_message.FromUserName,
          "msgtype":"news",
          "news":{"articles": articles}}

      @client.http_post("https://api.weixin.qq.com/cgi-bin/message/custom/send",
                        params,{}, WeixinAuthorize::CUSTOM_ENDPOINT)

    end

    # <PicUrl><![CDATA[this is a url]]></PicUrl>
    # <MediaId><![CDATA[media_id]]></MediaId>
    def response_image_message(options={})
      @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
      @pic_url  = @weixin_message.PicUrl  # 也可以直接通过此链接下载图片, 建议使用carrierwave.
      reply_image_message(generate_image(@media_id))
    end

    # <Title><![CDATA[公众平台官网链接]]></Title>
    # <Description><![CDATA[公众平台官网链接]]></Description>
    # <Url><![CDATA[url]]></Url>
    # def response_link_message(options={})
    #   @title = @weixin_message.Title
    #   @desc  = @weixin_message.Description
    #   @url   = @weixin_message.Url
    #   reply_text_message("回复链接信息")
    # end

    # <MediaId><![CDATA[media_id]]></MediaId>
    # <Format><![CDATA[Format]]></Format>
    # def response_voice_message(options={})
    #   @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
    #   @format   = @weixin_message.Format
    #   # 如果开启了语音翻译功能，@keyword则为翻译的结果
    #   # reply_text_message("回复语音信息: #{@keyword}")
    #   reply_voice_message(generate_voice(@media_id))
    # end

    # <MediaId><![CDATA[media_id]]></MediaId>
    # <ThumbMediaId><![CDATA[thumb_media_id]]></ThumbMediaId>
    # def response_video_message(options={})
    #   @media_id = @weixin_message.MediaId # 可以调用多媒体文件下载接口拉取数据。
    #   # 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
    #   @thumb_media_id = @weixin_message.ThumbMediaId
    #   reply_text_message("回复视频信息")
    # end

    def response_event_message(options={})
      event_type = @weixin_message.Event
      method_name = "handle_#{event_type.downcase}_event"
      if self.respond_to? method_name, true
        send(method_name)
      else
        send("handle_undefined_event")
      end
    end

    # 关注公众账号
    # def handle_subscribe_event
    #   if @keyword.present?
    #     # 扫描带参数二维码事件: 1. 用户未关注时，进行关注后的事件推送
    #     return reply_text_message("扫描带参数二维码事件: 1. 用户未关注时，进行关注后的事件推送, keyword: #{@keyword}")
    #   end
    #   Rails.logger.info("关注公众号")
    #   reply_text_message(AFTER_SUBSCRIBE_MESSAGE)
    # end

    # 取消关注
    def handle_unsubscribe_event
      Rails.logger.info("取消关注")
    end

    # 扫描带参数二维码事件: 2. 用户已关注时的事件推送
    # def handle_scan_event
    #   reply_text_message("扫描带参数二维码事件: 2. 用户已关注时的事件推送, keyword: #{@keyword}")
    # end

    # def handle_location_event # 上报地理位置事件
    #   @lat = @weixin_message.Latitude
    #   @lgt = @weixin_message.Longitude
    #   @precision = @weixin_message.Precision
    #   reply_text_message("Your Location is: #{@lat}, #{@lgt}, #{@precision}")
    # end

    # 点击菜单拉取消息时的事件推送
    # def handle_click_event
    #   reply_text_message("你点击了: #{@keyword}")
    # end

    # 点击菜单跳转链接时的事件推送
    # def handle_view_event
    #   Rails.logger.info("你点击了: #{@keyword}")
    # end

    # 帮助文档: https://github.com/lanrion/weixin_authorize/issues/22

    # 由于群发任务提交后，群发任务可能在一定时间后才完成，因此，群发接口调用时，仅会给出群发任务是否提交成功的提示，若群发任务提交成功，则在群发任务结束时，会向开发者在公众平台填写的开发者URL（callback URL）推送事件。

    # 推送的XML结构如下（发送成功时）：

    # <xml>
    # <ToUserName><![CDATA[gh_3e8adccde292]]></ToUserName>
    # <FromUserName><![CDATA[oR5Gjjl_eiZoUpGozMo7dbBJ362A]]></FromUserName>
    # <CreateTime>1394524295</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[MASSSENDJOBFINISH]]></Event>
    # <MsgID>1988</MsgID>
    # <Status><![CDATA[sendsuccess]]></Status>
    # <TotalCount>100</TotalCount>
    # <FilterCount>80</FilterCount>
    # <SentCount>75</SentCount>
    # <ErrorCount>5</ErrorCount>
    # </xml>
    def handle_masssendjobfinish_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
    # <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
    # <CreateTime>1395658920</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
    # <MsgID>200163836</MsgID>
    # <Status><![CDATA[success]]></Status>
    # </xml>
    # 推送模板信息回调，通知服务器是否成功推送
    def handle_templatesendjobfinish_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[card_pass_check]]></Event>  //不通过为card_not_pass_check
    # <CardId><![CDATA[cardid]]></CardId>
    # </xml>
    # 卡券审核事件，通知服务器卡券已(未)通过审核
    def handle_card_pass_check_event
      Rails.logger.info("回调事件处理")
    end

    def handle_card_not_pass_check_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <FriendUserName><![CDATA[FriendUser]]></FriendUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[user_get_card]]></Event>
    # <CardId><![CDATA[cardid]]></CardId>
    # <IsGiveByFriend>1</IsGiveByFriend>
    # <UserCardCode><![CDATA[12312312]]></UserCardCode>
    # <OuterId>0</OuterId>
    # </xml>
    # 卡券领取事件推送
    def handle_user_get_card_event
      membership = Membership.new
      membership.dianyuan_id=@weixin_message.OuterId
      membership.member_card_card_id=@weixin_message.CardId
      membership.openid=@weixin_message.FromUserName
      wxuser = WxUser.find_by_openid(@weixin_message.FromUserName)
      if !wxuser.nil?
        wxuser.is_member=true
        wxuser.save
        membership.wx_user_id=wxuser.id
      end
      membership.is_valid=true
      membership.save

      Rails.logger.info("")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[user_del_card]]></Event>
    # <CardId><![CDATA[cardid]]></CardId>
    # <UserCardCode><![CDATA[12312312]]></UserCardCode>
    # </xml>
    # 卡券删除事件推送
    def handle_user_del_card_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[user_consume_card]]></Event>
    # <CardId><![CDATA[cardid]]></CardId>
    # <UserCardCode><![CDATA[12312312]]></UserCardCode>
    # <ConsumeSource><![CDATA[(FROM_API)]]></ConsumeSource>
    # </xml>
    # 卡券核销事件推送
    def handle_user_consume_card_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[user_view_card]]></Event>
    # <CardId><![CDATA[cardid]]></CardId>
    # <UserCardCode><![CDATA[12312312]]></UserCardCode>
    # </xml>
    # 卡券进入会员卡事件推送
    def handle_user_view_card_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[FromUser]]></FromUserName>
    # <CreateTime>123456789</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[user_enter_session_from_card]]></Event>
    # <CardId><![CDATA[cardid]]></CardId>
    # <UserCardCode><![CDATA[12312312]]></UserCardCode>
    # </xml>
    # 从卡券进入公众号会话事件推送
    def handle_user_enter_session_from_card_event
      Rails.logger.info("回调事件处理")
    end

    # <xml>
    # <ToUserName><![CDATA[toUser]]></ToUserName>
    # <FromUserName><![CDATA[fromUser]]></FromUserName>
    # <CreateTime>1408622107</CreateTime>
    # <MsgType><![CDATA[event]]></MsgType>
    # <Event><![CDATA[poi_check_notify]]></Event>
    # <UniqId><![CDATA[123adb]]></UniqId>
    # <PoiId><![CDATA[123123]]></PoiId>
    # <Result><![CDATA[fail]]></Result>
    # <Msg><![CDATA[xxxxxx]]></Msg>
    # </xml>
    # 门店审核事件推送
    def handle_poi_check_notify_event
      Rails.logger.info("回调事件处理")
    end

    # 未定义的事件处理
    def handle_undefined_event
      Rails.logger.info("回调事件处理")
    end



    private
  # 根据两个点的经纬度计算两个点的距离（直线距离）
  def getDistance lat1,lng1, lat2, lng2

    lat_diff = (lat1 - lat2)*PI/180.0
    lng_diff = (lng1 - lng2)*PI/180.0
    lat_sin = Math.sin(lat_diff/2.0) ** 2
    lng_sin = Math.sin(lng_diff/2.0) ** 2
    first = Math.sqrt(lat_sin + Math.cos(lat1*PI/180.0) * Math.cos(lat2*PI/180.0) * lng_sin)
    result = (Math.asin(first) * 2 * 6378137.0).to_i
    result.to_f/1000
  end


  # 获得最近的三个店铺
  def getNearStores latitude,logitude
    nearStore = Array.new

    distanceArray = Array.new
    storeHash = Hash.new
    Store.all.each do |store|
      Rails.logger.info(store[:latitude])
      Rails.logger.info(store[:longitude])

      distance = getDistance store[:latitude].to_f, store[:longitude].to_f,latitude,logitude
      distanceArray.push(distance)
      storeHash[distance] = store
    end
    distanceArray.sort!

    returnHash = Hash.new
    for i in 0..2
      returnHash[distanceArray[i]] =storeHash[distanceArray[i]]
    end
    return returnHash

  end

  def http_get_baidu lat ,log
    require "open-uri"
    #如果有GET请求参数直接写在URI地址中
    uri = "http://api.map.baidu.com/geoconv/v1/?coords=#{log},#{lat}&ak=#{BAIDU_AK}"
    Rails.logger.info("百度改变维度地址#{uri}")
    html_response = nil
    open(uri) do |http|
      html_response = http.read
    end
    return html_response
  end


end
