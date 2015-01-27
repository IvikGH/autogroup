class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
    	t.string	:brand
    	t.string	:detail_id
    	t.string	:detail_title
    	t.decimal	:detail_price, precision: 8, scale: 2
    	t.string	:discount_group
    	t.float		:detail_weight, precision: 8, scale: 3

      t.timestamps null: false
    end
  end
end
