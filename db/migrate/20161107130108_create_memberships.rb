class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :dianyuan_id
      t.string :member_card_card_id
      t.integer :wx_user_id
      t.string :openid
      t.boolean :is_valid
      t.timestamps null: false
    end
  end
end
