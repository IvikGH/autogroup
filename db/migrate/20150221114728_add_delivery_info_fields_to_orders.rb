class AddDeliveryInfoFieldsToOrders < ActiveRecord::Migration
  def change
		add_column :orders, :city, :string
		add_column :orders, :delivery_service, :string
		add_column :orders, :delivery_point_address, :string
		add_column :orders, :family_name, :string
		add_column :orders, :middle_name, :string
		add_column :orders, :phone, :string
		add_column :orders, :additional_info, :string
  end
end
