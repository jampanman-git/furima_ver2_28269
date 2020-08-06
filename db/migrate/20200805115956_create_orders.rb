class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.item :item, null: false
      t.user :user, null: false
      t.timestamps
    end
  end
end
