class LineItem < ActiveRecord::Base
	belongs_to :order
  belongs_to :detail
  belongs_to :cart

  def total_price(this_user_id)
    # byebug
    if this_user_id
      this_user = User.find(this_user_id)
      detail.real_price * quantity * this_user.margin
    else
      detail.real_price * quantity * 3
    end
  end

  def user_price(this_user_id)
    if this_user_id
      this_user = User.find(this_user_id)
      detail.real_price * this_user.margin
    else
      detail.real_price * 3
    end
	end

end
