class LineItem < ActiveRecord::Base
	belongs_to :order
  belongs_to :detail
  belongs_to :cart

  def total_price
    detail.detail_price * quantity
	end

end
