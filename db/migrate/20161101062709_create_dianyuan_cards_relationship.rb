class CreateDianyuanCardsRelationship < ActiveRecord::Migration
  def change
    create_join_table :dianyuans, :member_cards, :table_name => :dianyuan_cards
    create_join_table :member_cards, :wx_users, :table_name => :cards_users
  end
end
