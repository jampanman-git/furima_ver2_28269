class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.integer :price, null:false
      t.references :user, null: false, forign_key: true
      t.references :category, null: false, forign_key: true
      t.references :status, null: false, forign_key: true
      t.references :area, null: false, forign_key: true
      t.references :deli_fee, null: false, forign_key: true
      t.references :deli_day, null: false, forign_key: true
      t.timestamps
    end
  end
end