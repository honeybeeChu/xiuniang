class CreatePointsRecords < ActiveRecord::Migration
  def change
    create_table :points_records do |t|
      t.integer :fans_id
      t.string :openid
      t.string :kdt_name
      t.string :mobile
      t.integer :amount
      t.integer :total
      t.string :description
      t.datetime :created_time
      t.string :client_hash

    end
    add_index :points_records,:openid
    add_index :points_records,:mobile
  end
end
