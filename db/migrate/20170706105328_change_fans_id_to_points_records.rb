class ChangeFansIdToPointsRecords < ActiveRecord::Migration
  def change
    change_column :points_records,:fans_id,:string
  end
end
