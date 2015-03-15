ActiveAdmin.register User do
  permit_params :name,
                :margin,
                :family_name,
                :middle_name,
                :phone,
                :city,
                :default_delivery_service,
                :default_delivery_point_address,
                :default_additional_info,
                :brands_margins

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
