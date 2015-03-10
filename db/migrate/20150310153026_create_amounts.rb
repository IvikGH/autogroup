class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.integer :brand_id,     null: false, index: true
      t.string  :detaill_code, null: false, index: true
      t.integer :quantity,     null: false

      t.timestamps null: false
    end
  end
end
