class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :sid
      t.string :business_name
      t.string :branch_name
      t.string :province
      t.string :city
      t.string :district
      t.string :address
      t.string :telephone
      t.string :categories
      t.string :offset_type
      t.string :longitude
      t.string :latitude
      t.string :photo_list
      t.string :recommend
      t.string :special
      t.string :introduction
      t.string :open_time
      t.string :avg_price
      t.string :map_img

      t.timestamps null: false
    end
  end
end
