class DropRelationshipTables < ActiveRecord::Migration
  def change
    drop_table :cards_users
    drop_table :dianyuan_cards
  end
end
