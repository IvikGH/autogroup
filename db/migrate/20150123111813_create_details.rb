class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :brand_id, index: true
    	t.string	:detail_id,       null: false
    	t.string	:detail_title
    	t.decimal	:detail_price,    null: false, precision: 8, scale: 2
    	t.string	:discount_group,   null: false
    	t.float		:detail_weight,   null: false, precision: 8, scale: 3

      t.timestamps                null: false
    end
  end
end
