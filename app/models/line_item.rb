class LineItem < ActiveRecord::Base
	belongs_to :order
  belongs_to :detail
  belongs_to :cart

  def total_price(current_user_id)
  	this_user = User.find(current_user_id)
    detail.real_price * quantity * this_user.margin
	end

end
