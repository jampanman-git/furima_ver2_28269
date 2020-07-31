class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null:false
      t.string :name, null:false
      t.text :description, null:false
      t.string :category, null:false
      t.string :status, null:false
      t.string :deli_fee, null:false
      t.string :area, null:false
      t.string :deli_day, null:false
      t.integer :price, null:false
      t.references :user, null: false, forign_key: true
      t.timestamps
    end
  end
end
