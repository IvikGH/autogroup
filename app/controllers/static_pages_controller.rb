class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def home
  end

  def contacts
    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

  def about
  end

  def help
  end

  def import
    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

  def history
    respond_to do |format|
      format.html { render layout: "main" }
    end
  end

end
