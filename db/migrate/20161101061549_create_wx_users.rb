class CreateWxUsers < ActiveRecord::Migration
  def change
    create_table :wx_users do |t|
      t.string :openid
      t.string :nickname
      t.integer :sex
      t.string :language
      t.string :city
      t.string :province
      t.string :country
      t.string :headimgurl
      t.string :subscribe_time
      t.string :unionid
      t.string :remark
      t.integer :groupid
      t.integer :subscribe
      t.string :phone
    end
    add_index :wx_users,:nickname
  end
end
