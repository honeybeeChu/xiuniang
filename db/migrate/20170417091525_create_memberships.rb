class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :openid
      t.integer :dianyuan_id
      t.string :card_id
      t.string :code
      t.string :name
      t.integer :sex
      t.string :phone
      t.string :birthday
      t.string :idcard
      t.string :email
      t.string :location
      t.integer :postcode
      t.string :education_backgro
      t.string :industry
      t.string :income
      t.string :habit
      t.integer :bonus
      t.integer :balance
      t.integer :level
      t.string :user_card_status
      t.boolean :has_active
    end
    add_index :memberships,:openid
  end
end
