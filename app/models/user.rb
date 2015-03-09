class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise 	:database_authenticatable,
  				:registerable,
         	:recoverable,
         	:rememberable,
         	:trackable,
         	:validatable
  store_accessor :brands_margins, :quantity_to_cart

  def self.set_quantity(userid)
    user = User.find(userid)
    # user.brands_margins = { quantity_to_cart: 1 }
    # user.save
    quantity = user.brands_margins['quantity_to_cart'].next
    user.brands_margins = { quantity_to_cart: quantity }
    user.save
  end

end
