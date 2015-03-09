class AddBrandsMarginsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :brands_margins, :hstore, default: { :quantity_to_cart => 1 }
  end

  def down
    remove_column :users, :brands_margins
  end
end
