class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal, null:false
      t.integer :prefecture, null:false
      t.string :city, null:false
      t.string :house_num, null:false
      t.string :building
      t.string :phone, null:false
      t.references :item, null:false
      t.timestamps
    end
  end
end
