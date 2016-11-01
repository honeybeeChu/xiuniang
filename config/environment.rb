# Load the Rails application.
require File.expand_path('../application', __FILE__)

APP_SERVER = 'http://wechat.xiuniang.cn'.freeze


# Initialize the Rails application.
Rails.application.initialize!

# baidu map AK value
BAIDU_AK='L6tV0zhkiNFQnuYIWdIC39wcuHMRR5ML'

# DIDI KEY
DD_APPID='didi6479505A4F6E636F3047536C534D45'
DD_SECRET='616af9250e2378cc99b45fc3650ab237'

# 短信下发相关参数
SMS_APPKEY='358efcc591007c742e5da60c58e5faf9'
SMS_ACCOUNT='cf_xiuniang'
SMS_URL='https://106.ihuyi.com/webservice/sms.php?method=Submit&account=cf_xiuniang&password=358efcc591007c742e5da60c58e5faf9'


# 获取oauth code的微信ｕｒｌ
WX_APPID='wx9faf547b0e25cf9e' # 丝酝丝绸
WX_APPID='wxa4de3c29bddd316e' # 绣娘丝绸

# 开发者ｓｅｃｒｅｔ
WX_SECRET='438a11a1c61fff7b756fc708046a5546'   # 丝酝丝绸
# 获取oauth code的微信ｕｒｌ
WX_OAUTH_CODE_URL='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9faf547b0e25cf9e' # 丝酝丝绸
# oauth_code的跳转链接
WX_OAUTH_REDIRECT_RUL= 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx9faf547b0e25cf9e&secret=438a11a1c61fff7b756fc708046a5546&code='   # 丝酝丝绸
# membership_card_id
WX_MEMBERSHIP_CARD_ID='pFS7Fjg8kV1IdDz01r4SQwMkuCKc' # 丝酝丝绸





# 店员信息的查询接口
DIANYUAN_INFO_URL='http://58.210.143.138:6081/xiuniang-server-0.0.1-SNAPSHOT/servlet/DianyuanInfoServlet'





#　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝微　信　相　关　的　接　口＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
# 创建会员卡二维码接口，http请求方式: POST
QRCODE_CREATE_URL='https://api.weixin.qq.com/card/qrcode/create?access_token=TOKEN'

#更新会员信息(更新会员的积分)
UPDATE_MEMBER_INFO_URL='https://api.weixin.qq.com/card/membercard/updateuser?access_token='






#　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝百　胜　相　关　的　接　口＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#efast订单列表查询接口
GET_ORDER_URL='http://121.40.45.82/efast/efast_api/webservice/web/index.php?app_act=efast.trade.list.get&app_nick=openapi&app_key=8888&app_secret=8888'.freeze


# 百胜相关的接口
BAISHENG_SERVER_URL='http://58.210.143.138:8044/ERP2Service.ashx'
# 会员卡的开卡接口的ｕｒｌ地址
OPEN_MEMBERSHIP_CARD_URL = '?app_mode=VipBusiness_DoBusinessProcess&OP=1102&Key= iN7uMgedkNC2a0MtProwbDFBRhlaJLbO&
Invoices='









