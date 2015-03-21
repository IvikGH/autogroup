class AddBooleansToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :activated, :boolean, default: false
  end
end
