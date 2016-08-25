# encoding: utf-8
# Use this hook to configure WeixinRailsMiddleware bahaviors.
WeixinRailsMiddleware.configure do |config|

  ## NOTE:
  ## If you config all them, it will use `weixin_token_string` default

  ## Config public_account_class if you SAVE public_account into database ##
  # Th first configure is fit for your weixin public_account is saved in database.
  # +public_account_class+ The class name that to save your public_account
  # config.public_account_class = "PublicAccount"

  ## Here configure is for you DON'T WANT TO SAVE your public account into database ##
  # Or the other configure is fit for only one weixin public_account
  # If you config `weixin_token_string`, so it will directly use it
  config.weixin_token_string = '335a9d6438c4f41fdcf7b789'
  # using to weixin server url to validate the token can be trusted.
  config.weixin_secret_string = '6d5dd9526242c753746ae3a8b54affe6'
  # 加密配置，如果需要加密，配置以下参数
  config.encoding_aes_key = 'ef525f6eb0ddf3b1ee8a8d142d40286a94dd199c8ba'
  config.app_id = "wx9faf547b0e25cf9e"

  ## You can custom your adapter to validate your weixin account ##
  # Wiki https://github.com/lanrion/weixin_rails_middleware/wiki/Custom-Adapter
  # config.custom_adapter = "MyCustomAdapter"

end
