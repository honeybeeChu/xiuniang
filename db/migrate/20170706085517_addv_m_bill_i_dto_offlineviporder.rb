class AddvMBillIDtoOfflineviporder < ActiveRecord::Migration
  def change
    add_column :offline_vip_orders,:vMBillID,:string
  end
end
