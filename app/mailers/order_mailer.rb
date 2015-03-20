class OrderMailer < ApplicationMailer
  default from: 'andoidxx@gmail.com'

  def new_order(order)
    @order = order
    mail( subject: 'Новый заказ на Autogroup.sk',
          to: ["igor.kalashniuk@gmail.com", "autobogua@gmail.com"] )
  end

end
