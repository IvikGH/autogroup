class History < ActiveRecord::Base
  belongs_to :user

  def self.write_history(order, user_id)
    order.line_items.each do |line_item|
      brand_name = line_item.detail.brand.name
      History.create( user_id: user_id,
                      order_number: order.id,
                      brand: brand_name,
                      detail_code: line_item.detail.detail_id,
                      detail_title: line_item.detail.detail_title,
                      real_price: line_item.user_price(user_id, brand_name),
                      detail_count: line_item.quantity,
                      total_price: line_item.total_price(user_id, brand_name))
      LineItem.destroy(line_item.id)
    end
  end

end
