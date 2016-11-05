class DianyuanController < ApplicationController
  layout 'manager'
  def dianyuanInfo
    if params[:DYMC].nil? || params[:DYMC].strip == ""
      @dianyuan_account = Dianyuan.all.size
      @Dianyuans = Dianyuan.paginate(page:params[:page],per_page:10)
      @current_page = params[:page] == nil ? 1 : params[:page]
      render "dianyuanInfo"
    else
      dymc = params[:DYMC].strip
      result_dianyuans = Dianyuan.where("DYMC LIKE '%#{dymc}%'")
      @Dianyuans = result_dianyuans.paginate(page:params[:page],per_page:10)
      @dianyuan_account = result_dianyuans.length
      @current_page = params[:page] == nil ? 1 : params[:page]
      @current_dymc = params[:DYMC]
      render "dianyuanInfo"
    end

  end


  def dianyuanCharts
    # 分组店员的店铺信息
    @dianpu_account = Dianyuan.groupKHDM
    @khdm=Array.new
    @datavalues = Array.new
    # @dd = Dianyuan.group(:KHDM)
    @dianpu_account.each  do |item|
      @khdm.push item[1]
      obj=Hash.new
      obj[:name] = item[1]
      obj[:value] = item[0].to_i
      @datavalues.push obj
    end

    @genderObj = Dianyuan.getGenderNumber
    render "dianyuanCharts"
  end

  def getDianyuanInfo
    redirect_to manager_dianyuan_path
  end

  # 同步店员数据信息
  def synchronizeDianyuan
    if(get(DIANYUAN_INFO_URL).nil?)
      redirect_to manager_dianyuan_path
    else
      dianyuansObj = JSON.parse(get(DIANYUAN_INFO_URL).to_s)
      dianyuansObj.each do |dianyuan|
        if Dianyuan.find_by_DYDM(dianyuan["DYDM"]).nil?
          new_dianyuan = Dianyuan.new
          if dianyuan["ADDRESS"] != "null"
            new_dianyuan.ADDRESS = dianyuan["ADDRESS"]
          end

          if dianyuan["BIRTHDAY"] != "null"
            new_dianyuan.BIRTHDAY = dianyuan["BIRTHDAY"]
          end

          if dianyuan["BYZD1"] != "null"
            new_dianyuan.BYZD1 = dianyuan["BYZD1"]
          end
          if dianyuan["BYZD2"] != "null"
            new_dianyuan.BYZD2 = dianyuan["BYZD2"]
          end
          if dianyuan["BYZD3"] != "null"
            new_dianyuan.BYZD3 = dianyuan["BYZD3"]
          end
          if dianyuan["BYZD4"] != "null"
            new_dianyuan.BYZD4 = dianyuan["BYZD4"]
          end
          if dianyuan["BYZD5"] != "null"
            new_dianyuan.BYZD5 = dianyuan["BYZD5"]
          end
          if dianyuan["BYZD6"] != "null"
            new_dianyuan.BYZD6 = dianyuan["BYZD6"]
          end
          if dianyuan["BYZD7"] != "null"
            new_dianyuan.BYZD7 = dianyuan["BYZD7"]
          end
          if dianyuan["BYZD8"] != "null"
            new_dianyuan.BYZD8 = dianyuan["BYZD8"]
          end
          if dianyuan["BYZD9"] != "null"
            new_dianyuan.BYZD9 = dianyuan["BYZD9"]
          end
          if dianyuan["BZ"] != "null"
            new_dianyuan.BZ = dianyuan["BZ"]
          end
          if dianyuan["DYDM"] != "null"
            new_dianyuan.DYDM = dianyuan["DYDM"]
          end
          if dianyuan["DYMC"] != "null"
            new_dianyuan.DYMC = dianyuan["DYMC"]
          end
          if dianyuan["DYXB"] != "null"
            new_dianyuan.DYXB = dianyuan["DYXB"]
          end
          if dianyuan["EDUCATION"] != "null"
            new_dianyuan.EDUCATION = dianyuan["EDUCATION"]
          end
          if dianyuan["EMAIL"] != "null"
            new_dianyuan.EMAIL = dianyuan["EMAIL"]
          end
          if dianyuan["EDUCATION"] != "null"
            new_dianyuan.EDUCATION = dianyuan["EDUCATION"]
          end
          if dianyuan["GWDDRQ"] != "null"
            new_dianyuan.GWDDRQ = dianyuan["GWDDRQ"]
          end
          if dianyuan["IDENT_NO"] != "null"
            new_dianyuan.IDENT_NO = dianyuan["IDENT_NO"]
          end
          if dianyuan["IN_DATE"] != "null"
            new_dianyuan.IN_DATE = dianyuan["IN_DATE"]
          end
          if dianyuan["KHDM"] != "null"
            new_dianyuan.KHDM = dianyuan["KHDM"]
          end
          if dianyuan["KWDM"] != "null"
            new_dianyuan.KWDM = dianyuan["KWDM"]
          end
          if dianyuan["LastChanged"] != "null"
            new_dianyuan.LastChanged = dianyuan["LastChanged"]
          end
          if dianyuan["MOBILE"] != "null"
            new_dianyuan.MOBILE = dianyuan["MOBILE"]
          end
          if dianyuan["ORIGIN"] != "null"
            new_dianyuan.ORIGIN = dianyuan["ORIGIN"]
          end
          if dianyuan["OUT"] != "null"
            new_dianyuan.OUT = dianyuan["OUT"]
          end
          if dianyuan["OUT_DATE"] != "null"
            new_dianyuan.OUT_DATE = dianyuan["OUT_DATE"]
          end
          if dianyuan["PHONE"] != "null"
            new_dianyuan.PHONE = dianyuan["PHONE"]
          end
          if dianyuan["QDBZ"] != "null"
            new_dianyuan.QDBZ = dianyuan["QDBZ"]
          end
          if dianyuan["QDDM"] != "null"
            new_dianyuan.QDDM = dianyuan["QDDM"]
          end
          if dianyuan["QMM"] != "null"
            new_dianyuan.QMM = dianyuan["QMM"]
          end
          if dianyuan["XZDM"] != "null"
            new_dianyuan.XZDM = dianyuan["XZDM"]
          end
          if dianyuan["ZDZK"] != "null"
            new_dianyuan.ZDZK = dianyuan["ZDZK"]
          end
          if dianyuan["ZJF"] != "null"
            new_dianyuan.ZJF = dianyuan["ZJF"]
          end

          new_dianyuan.save

        end
      end
      redirect_to manager_dianyuan_path
    end

  end


  # 下载浏览店员对应的二维码的链接
  def downloadQrcode

    # @@client = WeixinAuthorize::Client.new(WX_APPID, WX_SECRET)
    create_qrcode_json =  {
        "action_name": "QR_CARD",
        "expire_seconds": "",  #不填默认为３６５天，即一年
        "action_info": {
            "card": {
                "card_id": WX_MEMBERSHIP_CARD_ID,
                "code": "",
                "openid": "",
                "is_unique_code": false ,
                "outer_str":params[:dydm]
            }
        }
    }

    $client ||= WeixinAuthorize::Client.new(WX_APPID, WX_SECRET)

    result_json = $client.http_post(QRCODE_CREATE_URL,create_qrcode_json,{access_token:$client.get_access_token},WeixinAuthorize::CUSTOM_ENDPOINT)
    redirect_to result_json.result[:show_qrcode_url]

  end

  private
  # ｐｏｓｔ请求处理方法
  def post(url, params)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.use_ssl = true
    end
    begin
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json;charset=utf-8'
      request['User-Agent'] = 'Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0'
      request['X-ACL-TOKEN'] = 'xxx_token'
      #request.set_form_data(params)
      request.body = params
      response = http.start { |http| http.request(request) }

      return response.body
    rescue => err
      return nil
    end
  end


  def get(url)
    begin
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return response
    rescue => err
      return nil
    end

  end
end
