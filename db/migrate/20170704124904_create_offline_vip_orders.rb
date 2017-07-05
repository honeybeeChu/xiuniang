class CreateOfflineVipOrders < ActiveRecord::Migration
  def change
    create_table :offline_vip_orders do |t|

      t.string :vip_card
      t.timestamp :trade_date
      t.string :gkmc
      t.integer :sex
      t.string :get_money
      t.string :telephone
      t.string :vshop
      t.string :vempcode
      t.string :vspcode

    end
  end
end
