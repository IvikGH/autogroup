class CreateHistories < ActiveRecord::Migration

  def change
    create_table :histories do |t|
      t.integer :user_id, index: true
      t.integer :order_number, null: false
      t.string  :brand, null: false
      t.string  :detail_code, null: false, index: true
      t.string  :detail_title, null: false
      t.float   :real_price, null: false
      t.integer :detail_count, null: false
      t.float   :total_price, null: false
      t.date    :order_creation_date, null: false

      t.timestamps null: false
    end
  end

end
