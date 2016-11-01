class ChangeMembercardsMainkey < ActiveRecord::Migration
  def change
    change_column :member_cards,:card_id,:string
  end
end
