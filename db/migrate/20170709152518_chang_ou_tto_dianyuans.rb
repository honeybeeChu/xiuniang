class ChangOuTtoDianyuans < ActiveRecord::Migration
  def change
    rename_column :dianyuans,:OUT,:ISOUT
  end
end
