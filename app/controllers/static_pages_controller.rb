class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def home
  end

  def contacts
  end

  def about
  end

  def help
  end
end
