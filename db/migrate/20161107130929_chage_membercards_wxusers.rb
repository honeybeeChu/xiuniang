class ChageMembercardsWxusers < ActiveRecord::Migration
  def change
    add_column :member_cards,:description,:string
    add_column :wx_users,:is_member,:boolean
  end
end
