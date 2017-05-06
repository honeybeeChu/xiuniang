class AddindexWxuser < ActiveRecord::Migration
  def change
    add_index :wx_users,:openid
  end
end
