class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.integer :price, null:false
      t.references :user, null: false, forign_key: true
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :area_id, null: false
      t.integer :deli_fee_id, null: false
      t.integer :deli_day_id, null: false
      t.timestamps
    end
  end
end