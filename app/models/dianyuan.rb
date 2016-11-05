class Dianyuan < ActiveRecord::Base

  # 返回每个店铺的店铺代码和对应的店铺个数，前台展示占比
  def self.groupKHDM
    Dianyuan.connection.execute("select count(1),KHDM from dianyuans group by KHDM")
  end

  # 返回所有店员的男女性别比例
  def self.getGenderNumber
    Dianyuan.where("DYXB='0'").length
    {"nan"=>Dianyuan.where("DYXB='1'").length,"nv"=>Dianyuan.where("DYXB='0'").length}
  end


end
