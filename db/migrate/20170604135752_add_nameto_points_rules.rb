class AddNametoPointsRules < ActiveRecord::Migration
  def change
    add_column :points_rules,:name,:string
  end
end
