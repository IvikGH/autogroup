ActiveAdmin.register History do

  index do
    column  :user_id
    column :order_id
    column :brand
    column :detail_code
    column :detail_title
    column :real_price
    column :detail_count
    column :total_price
  end

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
