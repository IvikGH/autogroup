class AddQuantityToCartToDetails < ActiveRecord::Migration
  def change
    add_column :details, :quantity_to_cart, :integer, default: 1
  end
end
