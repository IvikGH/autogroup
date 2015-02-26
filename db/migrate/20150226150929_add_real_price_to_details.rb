class AddRealPriceToDetails < ActiveRecord::Migration
  def change
    add_column :details, :real_price, :decimal, precision: 8, scale: 3
  end
end
