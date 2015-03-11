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

end
