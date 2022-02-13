class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.string     :post_code,        null: false
      t.integer    :prefectures_id,   null: false
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.references :order,            foreign_key: true
      t.timestamps
    end
  end
end
