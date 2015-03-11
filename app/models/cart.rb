class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_detail(detail_id)
    current_item = line_items.find_by(detail_id: detail_id)
    detail = Detail.find(detail_id)
    details_quantity = detail.quantity_to_cart.to_i
    if current_item
      current_item.quantity += details_quantity
    else
      current_item = line_items.build(detail_id: detail_id)
      current_item.quantity = details_quantity
      detail.quantity_to_cart = 1
      detail.save
    end
    current_item
  end

  def decrement_line_item_quantity(line_item_id)
    current_item = line_items.find(line_item_id)
    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end
    current_item
  end
  def increment_line_item_quantity(line_item_id)
    current_item = line_items.find(line_item_id)
    current_item.quantity += 1
    current_item
  end

  def full_price(this_user_id)
    line_items.to_a.sum { |item| item.total_price( this_user_id,
                                                   item.detail.brand.name) }
  end

end
