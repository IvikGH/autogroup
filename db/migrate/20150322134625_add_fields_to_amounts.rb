class AddFieldsToAmounts < ActiveRecord::Migration
  def change
    add_column :amounts, :fixed_price, :boolean, default: false
    add_column :amounts, :price, :decimal, precision: 8, scale: 2
    add_column :amounts, :category, :string
    add_column :amounts, :short_descr, :string
    add_column :amounts, :large_descr, :text
  end
end
