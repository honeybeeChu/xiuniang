class CreatePointsRules < ActiveRecord::Migration
  def change
    create_table :points_rules do |t|
      t.integer :level
      t.integer :consumption
      t.float :rate
      t.timestamps null: false
    end
  end
end
