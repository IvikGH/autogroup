class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
    	t.string	:brand
    	t.string	:detail_id
    	t.string	:detail_title
    	t.float		:detail_price
    	t.string	:discount_group
    	t.float		:detail_weight

      t.timestamps null: false
    end
  end
end
