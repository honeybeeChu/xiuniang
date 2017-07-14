class ChangTypetomemberships < ActiveRecord::Migration
  def change
    change_column :memberships,:dianyuan_id,:string
    add_column :memberships,:created_at,:datetime
    rename_column :points_rules,:condition,:conditions
  end
end
