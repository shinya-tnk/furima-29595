class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, default: "", null: false
      t.integer :prefecture_id, default: "1"
      t.string :city, default: ""
      t.string :house_number, default: ""
      t.string :building_name, default: ""
      t.string :phone_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
