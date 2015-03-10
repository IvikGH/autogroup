class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_detail(detail_id, user_id)
    current_item = line_items.find_by(detail_id: detail_id)
    user = User.find(user_id)
    details_quantity = user.brands_margins["quantity_to_cart"].to_i
    if current_item
      current_item.quantity += details_quantity
    else
      current_item = line_items.build(detail_id: detail_id)
      current_item.quantity = details_quantity
      user.brands_margins = { :quantity_to_cart => 1,
                            "Bilstein" => 3,
                            "BMW" => 3,
                            "Chevrolet" => 3,
                            "Chrysler" => 3,
                            "Citroen" => 3,
                            "Fiat" => 3,
                            "Ford" => 3,
                            "Honda" => 3,
                            "Hyundai" => 3,
                            "Infiniti" => 3,
                            "Iveco" => 3,
                            "Jaguar" => 3,
                            "KIA" => 3,
                            "Land Rover" => 3,
                            "Mazda" => 3,
                            "Mercedes Benz" => 3,
                            "Mitsubishi" => 3,
                            "Nissan" => 3,
                            "Opel" => 3,
                            "Peugeot" => 3,
                            "Porsche" => 3,
                            "Renault" => 3,
                            "Seat" => 3,
                            "Skoda" => 3,
                            "Subaru" => 3,
                            "Suzuki" => 3,
                            "Toyota" => 3,
                            "VAG" => 3,
                            "Volvo" => 3,
                            "VOTEX" => 3,
                            "ZF" => 3 }
      user.save
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
    line_items.to_a.sum { |item| item.total_price(this_user_id) }
  end

end
