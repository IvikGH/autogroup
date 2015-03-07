class AddBrandsMarginsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :brands_margins, :hstore
  end

  def down
    remove_column :users, :brands_margins
  end
end
