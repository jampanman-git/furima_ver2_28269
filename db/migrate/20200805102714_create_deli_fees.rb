class CreateDeliFees < ActiveRecord::Migration[6.0]
  def change
    create_table :deli_fees do |t|

      t.timestamps
    end
  end
end
