class AddColumenToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships,:total_consumption,:integer
    add_column :memberships,:recent_consumption,:integer
    add_column :memberships,:update_points_date,:datetime
  end
end
