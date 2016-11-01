class CreateMemberCards < ActiveRecord::Migration
  def change
    create_table :member_cards ,:primary_key => :card_id do |t|
      t.string :brand_name
      t.string :title
      t.string :sub_title
      t.timestamps null: false
    end
  end
end
