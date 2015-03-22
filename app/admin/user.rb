ActiveAdmin.register User do

  index do
    column :activated
    column :email
    column :name
    column :middle_name
    column :family_name
    column :phone
    column :city
    column :brands_margins
    column :default_delivery_service
    column :default_delivery_point_address
    column :default_additional_info
    column :margin
    column :admin
    actions
  end



  permit_params :name,
                :margin,
                :family_name,
                :middle_name,
                :phone,
                :city,
                :default_delivery_service,
                :default_delivery_point_address,
                :default_additional_info,
                :brands_margins,
                :activated,
                :admin


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
