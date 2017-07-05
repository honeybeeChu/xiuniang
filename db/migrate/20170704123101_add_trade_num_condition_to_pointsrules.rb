class AddTradeNumConditionToPointsrules < ActiveRecord::Migration
  def change
    add_column :points_rules,:trade_num,:integer
    add_column :points_rules,:condition,:integer
  end
end
