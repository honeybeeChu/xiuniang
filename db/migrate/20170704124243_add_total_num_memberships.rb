class AddTotalNumMemberships < ActiveRecord::Migration
  def change
    add_column :memberships,:total_num,:integer
  end
end
