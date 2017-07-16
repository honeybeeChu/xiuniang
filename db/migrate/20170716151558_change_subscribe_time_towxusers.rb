class ChangeSubscribeTimeTowxusers < ActiveRecord::Migration
  def change
    change_column :wx_users,:subscribe_time,:datetime
  end
end
