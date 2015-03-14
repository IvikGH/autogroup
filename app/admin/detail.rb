ActiveAdmin.register Detail do

  index do
    column "Brand" do |b|
      Detail.find(b).brand.name
    end
    column :detail_id
    column :detail_title
    column :detail_price
    column :discount_group
    column :detail_weight
    column :real_price
    column :zusatz
    column :ersatz
    actions
  end
  permit_params :detail_id,
                :detail_title,
                :detail_price,
                :discount_group,
                :detail_weight,
                :real_price,
                :zusatz,
                :ersatz,
                brand_id: []

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
