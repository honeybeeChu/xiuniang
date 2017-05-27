class CreateEfastOrders < ActiveRecord::Migration
  def change
    create_table :efast_orders do |t|

      t.string :sell_record_code
      t.string :order_status
      t.integer :shipping_status
      t.string :pay_status
      t.string :sale_channel_code
      t.string :shop_code
      t.string :buyer_name
      t.string :receiver_name
      t.string :receiver_country
      t.string :receiver_province
      t.string :receiver_city
      t.string :receiver_district
      t.string :receiver_street
      t.string :receiver_address
      t.string :receiver_addr
      t.string :receiver_zip_code
      t.string :receiver_mobile
      t.string :receiver_phone
      t.string :receiver_email
      t.integer :payable_money
      t.integer :order_money
      t.integer :discount_fee
      t.string :pay_code
      t.datetime :pay_time
      t.string :openid

    end
    add_index :efast_orders,:openid
    add_index :efast_orders,:receiver_mobile
  end
end
