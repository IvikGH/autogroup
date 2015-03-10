class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.integer :brand_id
      t.string :detaill_code
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
