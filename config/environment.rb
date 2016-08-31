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
WX_APPID='wx9faf547b0e25cf9e'
WX_SECRET='438a11a1c61fff7b756fc708046a5546'
WX_OAUTH_CODE_URL='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9faf547b0e25cf9e'

WX_OAUTH_REDIRECT_RUL= 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx9faf547b0e25cf9e&secret=438a11a1c61fff7b756fc708046a5546&code='