class AddvMBillIDtoOfflineviporder < ActiveRecord::Migration
  def change
    add_column :offline_vip_orders,:vMBillID,:String
  end
end
