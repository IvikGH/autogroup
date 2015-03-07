class AddZusatzErsatzToDetails < ActiveRecord::Migration
  def change
    add_column :details, :zusatz, :string
    add_column :details, :ersatz, :string
  end
end
