class WxUser < ActiveRecord::Base

  def self.group_province
    WxUser.connection.execute("select count(1),province from wx_users group by province")
  end
end
