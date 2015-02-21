class AddDeliveryInfoFieldsToUsers < ActiveRecord::Migration
  def change
		add_column :users, :family_name, :string
		add_column :users, :middle_name, :string
		add_column :users, :phone, :string
		add_column :users, :city, :string
		add_column :users, :default_delivery_service, :string
		add_column :users, :default_delivery_point_address, :string
		add_column :users, :default_additional_info, :text
  end
end
